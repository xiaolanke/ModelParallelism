import networkx
import itertools  
import operator
import heapq
import math

def topo(G, P):
    sorted_nodes = list(networkx.topological_sort(G))
    num_proc = len(P)
    num_nodes = G.number_of_nodes()
    nodes_per_proc = int(math.ceil(float(num_nodes)/num_proc))
    Nodes = G.nodes
    for num in xrange(num_proc):
        lo = nodes_per_proc*num
        hi = min(num_nodes, nodes_per_proc*(num+1))
        for ID in range(lo, hi, 1):
            curr_id = sorted_nodes[ID]
            G.nodes[curr_id]['p'] = num
    return G
