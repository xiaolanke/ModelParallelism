import itertools  
import operator
import heapq
import math

def topo(G, P):
    sorted_nodes = topological_sort(G)
    num_proc = len(P)
    num_nodes - G.number_of_nodes()
    nodes_per_proc = math.ceil(float(num_nodes)/num_proc)
    Nodes = G.nodes
    for num in num_proc:
        lo = nodes_per_proc*num
        hi = min(num_nodes, nodes_per_proc*(num+1))
        for ID in (lo, hi, 1):
            Nodes[sorted_nodes[ID]['id']]['p'] = num
    return G
