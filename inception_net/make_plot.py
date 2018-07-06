import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties

def plot(fix_total, arg):
	fontP = FontProperties()
	fontP.set_size('small')
	if (fix_total):
		topo_time = np.load("results/topo_time_fix_" + str(arg) + "_times_total.npy").astype(float)/1E6
		etf_time = np.load("results/etf_time_fix_" + str(arg) + "_times_total.npy").astype(float)/1E6
		sct_time = np.load("results/sct_time_fix_" + str(arg) + "_times_total.npy").astype(float)/1E6
	else:
		topo_time = np.load("results/topo_time_fix_each_"+str(arg) + ".npy").astype(float)/1E6
		etf_time = np.load("results/etf_time_fix_each_"+str(arg) + ".npy").astype(float)/1E6
		sct_time = np.load("results/sct_time_fix_each_"+str(arg) + ".npy").astype(float)/1E6
	print "topo:", topo_time
	print "etf:", etf_time
	print "sct:", sct_time
	num_procs = np.array([3, 6, 9, 12, 15])
	bandwidths = np.array([1e5, 1e7, 1e9, 1e11])
	names = np.array(["1E5", "1E7", "1E9", "1E11"])

	for i in xrange(4):
		plt.clf()
		art = []
		ax = plt.subplot(1,1,1)
		line_topo, = ax.plot(num_procs, topo_time[i], markersize=13, c='r', marker='o')
		line_etf, = ax.plot(num_procs, etf_time[i], markersize=13, c='b', marker='^')
		line_sct, = ax.plot(num_procs, sct_time[i], markersize=13, c='g', marker='*')
		lgd = plt.legend((line_topo, line_etf, line_sct), 
			('m-TOPO', 'm-ETF', 'm-SCT'), prop=fontP, loc=9, bbox_to_anchor=(0.5, -0.1), ncol=4)
		art.append(lgd)
		plt.xlabel("Number of processors")
		plt.ylabel("Makespan (in seconds)") 
		if (fix_total):
			plt.savefig("plots/"+str(arg)+"_times_fix_total_cnn_bandwidth" + names[i] + ".png",
				additional_artists=art,
				bbox_inches="tight")
		else:	
			plt.savefig("plots/"+str(arg)+"_fix_each_cnn_bandwidth" + names[i] + ".png",
				additional_artists=art,
				bbox_inches="tight")

