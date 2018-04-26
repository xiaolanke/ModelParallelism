import tensorflow as tf
import networkx as nx
from etf import *

def work():
	graph_def = tf.get_default_graph().as_graph_def(add_shapes=True)
	with open('classify_image_graph_def.pb', 'rb') as f:
	    graph_def.ParseFromString(f.read())

	tf.import_graph_def(graph_def,name='')

	graph = tf.get_default_graph()

	#write = tf.summary.FileWriter('./tt', graph)

	#tf.train.write_graph(graph, "models/", "graph.pb", as_text=True)

	_dict = {'Const':1, 'DecodeJpeg':10, 'Cast':1, 'ExpandDims':1, 'ResizeBilinear':1, 'Sub':1, 'Mul':3, 'Conv2D':10, 'BatchNormWithGlobalNormalization':3, 'CheckNumerics':1, 'Identity':1, 'Relu':2, 'MaxPool':5, 'AvgPool':5, 'Concat':1, 'Reshape':1, 'MatMul':3, 'BiasAdd':1, 'Softmax':3}

	G = nx.DiGraph()

	COMM = 1
	COMP = 3

	node_dict = {}
	i = 1
        #add node
	for node in graph.get_operations():
            output_shape = node.outputs[0].get_shape().as_list()
            if len(output_shape) == 0:
                G.add_node(i, weight=1)
            elif not all(output_shape):
                _sum = sum([p for p in output_shape if p != None])
                G.add_node(i, weight=_sum)
            else:               
		output_size = sum(output_shape)
                G.add_node(i, weight=_dict[node.type]*output_size*COMP)
            node_dict[node.name] = i
            i += 1
        #add edge
	for node in graph.get_operations():
	    for _input in node.inputs:  
                input_shape = _input.get_shape().as_list() 
                if len(input_shape) == 0:
                    G.add_edge(node_dict[_input.name[:-2]], node_dict[node.name], weight=1)
                    continue
                elif not all(input_shape):
                    _sum = sum([p for p in input_shape if p != None])
                    G.add_edge(node_dict[_input.name[:-2]], node_dict[node.name], weight=_sum)
                    continue
                else:
		   input_size = sum(input_shape)
		   G.add_edge(node_dict[_input.name[:-2]], node_dict[node.name], weight=input_size*COMM)
	P = nx.Graph()
	P.add_node(1)
	P.add_node(2)
	P.add_node(3)
	P.add_edge(1, 1, weight=0)
	P.add_edge(2, 2, weight=0)
	P.add_edge(3, 3, weight=0)
	P.add_edge(1, 2, weight=1)
	P.add_edge(1, 3, weight=2)
	P.add_edge(2, 3, weight=1)
	for id in G.nodes():
	    G.nodes[id]['id'] = id
	for id in P.nodes():
	    P.nodes[id]['id'] = id
        #for u,v,a in G.edges(data=True):
            #print u,v,a

	G = etf(G, P)

	#set device
	for node in graph.get_operations():
		index = node_dict[node.name]
		pro = str(G.nodes[index]['p'])
		node._set_device(''.join(['/job:worker/task:', pro]))

	graph_def = tf.get_default_graph()
	writer = tf.summary.FileWriter('./train', graph_def)
	#tf.train.write_graph(graph, "mod/", "graph.pb", as_text=True)

work()




