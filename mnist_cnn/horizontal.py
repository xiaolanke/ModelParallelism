import tensorflow as tf
import networkx as nx
import json
from google.protobuf import text_format
import re
from etf import *

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
	
	#set device
	p1 = ["placeholder", "pool1", "fc1", "loss", "adam_optimizer/beta2_power", "adam_optimizer/gradients/conv1", "adam_optimizer/gradients/pool2", "adam_optimizer/gradients/Mean_grad", "adam_optimizer/gradients/Fill", "adam_optimizer/gradients/shape", "adam_optimizer/gradients/grad_ys_0", "adam_optimizer/Adam/update_fc2", "adam_optimizer/Adam/mul", "adam_optimizer/Adam/beta1", "adam_optimizer/Adam/mul", "adam_optimizer/Adam"]
	p2 = ["reshape", "conv2", "fc2", "mean", "adam_optimizer/beta1_power", "adam_optimizer/gradients/pool1", "adam_optimizer/gradients/fc1", "adam_optimizer/gradients/zeros-like", "adam_optimizer/Adam/update_conv1", "adam_optimizer/Adam/mul_1", "adam_optimizer/Adam/beta2"]
	p3 = ["conv1", "pool2", "placeholder_1", "const", "adam_optimizer/gradients/conv2", "adam_optimizer/gradients/fc2", "adam_optimizer/gradients/loss", "adam_optimizer/Adam/update_conv2", "adam_optimizer/Adam/update_fc1", "adam_optimizer/Adam/assign", "adam_optimizer/Adam/assign_1"]
	for node in graph.get_operations():
		for prefix in p1:
			if node.name.startswith(prefix):
				 node._set_device('/job:worker/task:0')
				 break
		for prefix in p2:
			if node.name.startswith(prefix):
				 node._set_device('/job:worker/task:1')
				 break
		for prefix in p3:
			if node.name.startswith(prefix):
				 node._set_device('/job:worker/task:2')
				 break
	
	#report
	span = max([G.nodes[i]['f'] for i in G.nodes()])
	print(''.join(['makespan: ', str(span), ' microseconds']))
	#computation time and memory on each processors
	node = {}
	comp = {}
	memo = {}
	for i in I:
		node[i] = 0
		comp[i] = 0
		memo[i] = 0
	for i in G.nodes():
		node[G.nodes[i]['p']] += 1
		comp[G.nodes[i]['p']] += G.nodes[i]['weight']
		memo[G.nodes[i]['p']] += G.nodes[i]['memory']
	for key in memo:
		print(''.join(['P', str(key), ': ', str(node[key]), ' nodes, ', str(comp[key]), ' microseconds, ', str(memo[key]), ' bytes']))
	
	writer = tf.summary.FileWriter('./horizontal', graph)
	writer.flush()
	
	
if __name__ == '__main__':
	partition()













