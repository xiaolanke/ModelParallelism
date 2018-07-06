import tensorflow as tf
import networkx as nx
import json
from google.protobuf import text_format
import numpy as np
import re
from etf import *
from sct_change import *
from topo import *
from make_plot import plot
import copy
import sys

def experiments(bandwidths, num_procs, fix_total, arg):
	'''
		Note that many of the nodes are unused, so some of the nodes in the graph 
		may not have data in the dictionaries. Also some nodes don't have shape.
		Another Weird thing is that the three dictionaries are a little different.
	'''

	#import graph
	graph_def = tf.get_default_graph().as_graph_def(add_shapes=True)
	with open('./model/cnn_after.pb', 'rb') as f:
	    text_format.Merge(f.read(), graph_def)
	tf.import_graph_def(graph_def,name='')
	graph = tf.get_default_graph()
	
	#get computation time
	comp_dict = {}
	with open ('timeline.json', 'r') as f:
		raw_data = json.load(f)
		data = raw_data['traceEvents']
		size = len(data)
		for i in range(size):
			if 'ts' in data[i] and i != (size - 1):
				name = data[i]['args']['name']
				duration = data[i + 1]['ts'] - data[i]['ts']
				comp_dict[name] = float(duration)

	#get memory and shape
	memo_dict = {}
	shape_dict = {}
	with open ('timeline_memory.json', 'r') as f:
		raw_data = json.load(f)
		data = raw_data['traceEvents']
		size = len(data)
		for i in range(size):
			if 'args' in data[i]:
				args = data[i]['args']
				name = data[i]['name']
				if 'snapshot' in args:
					tensor = args['snapshot']['tensor_description']
					#get shape
					tensor_size = re.findall('size: ([0-9]+)', tensor)
					_prod = 1
					for s in tensor_size:
						_prod *= float(s)
					shape_dict[name] = _prod * 4.0
					#get memory
					memo = re.findall('requested_bytes: ([0-9]+)', tensor)
					if len(memo) == 0:
						memo_dict[name] = 0.0
					else:
						memo_dict[name] = float(memo[0])
	# perform experiments on different number of processors and bandwidth, record the results
	time = np.zeros([3, len(bandwidths), len(num_procs)])

	methods = ["topo", "etf", "sct"]
	for k in xrange(len(methods)):
		for i in xrange(len(bandwidths)):
			bandwidth = bandwidths[i]
			for j in xrange(len(num_procs)):
				num_proc = num_procs[j]
				time[k][i][j] = partition(bandwidth, num_proc, graph, memo_dict, comp_dict, shape_dict, fix_total, arg, methods[k])
				
	if (fix_total):
		np.save("results/topo_time_fix_" + str(arg) + "_times_total", time[0])
		np.save("results/etf_time_fix_" + str(arg) + "_times_total", time[1])
		np.save("results/sct_time_fix_" + str(arg) + "_times_total", time[2])
	else:
		np.save("results/topo_time_fix_each_"+str(arg), time[0])
		np.save("results/etf_time_fix_each_"+str(arg), time[1])
		np.save("results/sct_time_fix_each_"+str(arg), time[2])
	plot(fix_total,arg)

def partition(BANDWIDTH, num_proc, graph, memo_dict, comp_dict, shape_dict, fix_total, arg, method ):
	#set the processor config
	G,sum_weight = create_graph(graph, memo_dict, comp_dict, shape_dict, num_proc, BANDWIDTH)
	P = get_processor_graph(num_proc)
	
	#run the algorithm
	print "\n##### Condition: BANDWIDTH ", BANDWIDTH, "  NUM OF PROCS ", num_proc
	if (fix_total == True):
		if (method == "topo"):
			print "m-TOPO: "
			_G, span = topo(G, P, float(sum_weight*arg)/num_proc)
		elif (method == "sct"):
			print "m-SCT: "
			_G, span = sct(G, P, float(sum_weight*arg)/num_proc)
		elif (method == "etf"):
			print "m-ETF: "
			_G, span = etf(G, P, float(sum_weight*arg)/num_proc)
	else:
		if (method == "topo"):
			print "m-TOPO: "
			_G, span = topo(G, P, arg)
		elif (method == "sct"):
			print "m-SCT: "
			_G, span = sct(G, P, arg)
		elif (method == "etf"):
			print "m-ETF: "
			_G, span = etf(G, P, arg)

	return span

def create_graph(graph, memo_dict, comp_dict, shape_dict, num_proc, BANDWIDTH):
	#start to create simulation graph
	G = nx.DiGraph()

	node_dict = {}
	i = 1
	#add node
	sum_weight = 0.0
	for node in graph.get_operations():
		memo = 0
		if node.name in memo_dict:
			memo = memo_dict[node.name]
			sum_weight += memo_dict[node.name]
		if node.name in comp_dict:
			G.add_node(i, weight=comp_dict[node.name], name=node.name, id=i, memory=memo, favor=-1, parent=0)

		else:
			G.add_node(i, weight=1.0, name=node.name, id=i, memory=memo, favor=-1, parent=0)
		node_dict[node.name] = i
		i += 1

	#add edge
	i = 1
	for node in graph.get_operations():
		for _input in node.inputs: 
			name = _input.name[:-2]
			if name in shape_dict:
				weight = shape_dict[name] * 1e6 / BANDWIDTH  
				G.add_edge(node_dict[name], node_dict[node.name], weight=weight, id=i)
			else:
				G.add_edge(node_dict[name], node_dict[node.name], weight=0.0, id=i)
			i += 1
	return G,sum_weight


def get_processor_graph(num_proc):
	P = nx.Graph()
	for ID in xrange(num_proc):
		P.add_node(ID+1, id=ID+1, l=-1, s='free', size=0.0)
	for ID1 in xrange(num_proc):
		for ID2 in xrange(num_proc):
			if (ID1 == ID2):
				P.add_edge(ID1+1, ID2+1, weight=0)
			else:
				P.add_edge(ID1+1, ID2+1, weight=1)
	return P
	

if __name__ == '__main__':
	bandwidths = [1e5, 1e7, 1e9, 1e11]
	num_procs = [3, 6, 9, 12, 15]

	if (len(sys.argv) != 3):
		print "Usage: "
		print "If want fixed total memory to be n times graph required memory, python simulate fix n"
		print "If want fixed memory to be M on each machine, python simulate vary M" 
		sys.exit() 
	elif (sys.argv[1] == "fix"):
		experiments(bandwidths, num_procs, True, float(sys.argv[2]))	
	else:
		experiments(bandwidths, num_procs, False, float(sys.argv[2]))
