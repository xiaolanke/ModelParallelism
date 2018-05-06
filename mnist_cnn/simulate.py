import tensorflow as tf
import networkx as nx
import json
from google.protobuf import text_format
import re
from etf import *
from topo import topo 
def partition():
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
	

	#set communication time
	BANDWIDTH = 1e9
	
	#start to create simulation graph
	G = nx.DiGraph()

	node_dict = {}
	i = 1
    #add node
	for node in graph.get_operations():
		
		memo = 0
		if node.name in memo_dict:
			memo = memo_dict[node.name]
		if node.name in comp_dict:
			G.add_node(i, weight=comp_dict[node.name], name=node.name, id=i, memory=memo)
		else:
			G.add_node(i, weight=1.0, name=node.name, id=i, memory=memo)
		node_dict[node.name] = i
		i += 1

    #add edge
	for node in graph.get_operations():
		for _input in node.inputs: 
			name = _input.name[:-2]
			if name in shape_dict:
				weight = shape_dict[name] * 1e6 / BANDWIDTH  
				G.add_edge(node_dict[name], node_dict[node.name], weight=weight)
			else:
				G.add_edge(node_dict[name], node_dict[node.name], weight=0.0)

	#set the processor config
	P = nx.Graph()
	P.add_node(1, id=1)
	P.add_node(2, id=2)
	P.add_node(3, id=3)
	P.add_edge(1, 1, weight=0)
	P.add_edge(2, 2, weight=0)
	P.add_edge(3, 3, weight=0)
	P.add_edge(1, 2, weight=1)
	P.add_edge(1, 3, weight=1)
	P.add_edge(2, 3, weight=1)
	
	'''
	for id in G.nodes():
	    G.nodes[id]['id'] = id
	for id in P.nodes():
	    P.nodes[id]['id'] = id   
    for u,v,a in G.edges(data=True):
        print u,v,a
	'''
	
	#run the algorithm
	G = topo(G, P)
        #G = etf(G, P)
	
	#set device
	for node in graph.get_operations():
		index = node_dict[node.name]
		pro = str(G.nodes[index]['p'])
		node._set_device(''.join(['/job:worker/task:', pro]))
	
	writer = tf.summary.FileWriter('./partition', graph)
	writer.flush()
	
	
if __name__ == '__main__':
	partition()













