
def horizontal(_G, _P):

	G = _G
	P = _P

	

	
	#report
	#for t in G.nodes():
		#print(''.join([G.nodes[t]['name'], ':', str(G.nodes[t]['p'])]))
	#makespan
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
	
	return G
