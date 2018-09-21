#!/usr/bin/env python

import argparse
import sys
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data
from simulate.py import *

# Flags for defining the tf.train.ClusterSpec
tf.app.flags.DEFINE_string("hosts", "","Comma-separated list of hostname:port pairs")

# Flags for defining the tf.train.Server
tf.app.flags.DEFINE_integer("task_index", 0, "Index of task within the job")
tf.app.flags.DEFINE_integer("steps", 100, "Number of training steps")

FLAGS = tf.app.flags.FLAGS
batch_size = 100

def main(_):
  hosts = FLAGS.hosts.split(",")

  # Create a cluster from the parameter server and worker hosts.
  cluster = tf.train.ClusterSpec({"worker": hosts})

  # Create and start a server for the local task.
  server = tf.train.Server(cluster, job_name="worker", task_index=FLAGS.task_index)

  is_chief = (FLAGS.task_index == 0)

  if not is_chief:
    server.join()
  else:
    #import graph
    graph_def = tf.get_default_graph().as_graph_def(add_shapes=True)
    with open('./model/cnn_after.pb', 'rb') as f:
        text_format.Merge(f.read(), graph_def)
    tf.import_graph_def(graph_def,name='')
    graph = tf.get_default_graph()

    # Partition the graph
    metadata = get_metadata()
    G, span, node_dict = partition(1e11, 5, metadata[0], metadata[1], metadata[2], metadata[3], True, 3.0, 'etf')
    for node in graph.get_operations():
      if node.name in node_dict:
        i = G.nodes[node_dict[node.name]]['p']
        node.device = "/job:worker/task:" + (i - 1)
      else:
        node.device = "/job:worker/task:0"

    mnist = input_data.read_data_sets('MNIST_data', one_hot=True)

    # Create a "supervisor", which oversees the training process.
    sv = tf.train.Supervisor(is_chief=is_chief,
                             logdir="./train_logs",
                             init_op=init_op,
                             summary_op=summary_op,
                             global_step=global_step)

    print "supervisor created"

    # The supervisor takes care of session initialization, restoring from
    # a checkpoint, and closing when done or an error occurs.
    with sv.managed_session(server.target) as sess:
      # Loop until the supervisor shuts down or 1000000 steps have completed.
      print "Start session"
      tf.Print(sv.summary_op)
      step = 0
      while not sv.should_stop() and step < FLAGS.steps:
        # Run a training step asynchronously.
        # See `tf.train.SyncReplicasOptimizer` for additional details on how to
        # perform *synchronous* training.
        batch = mnist.train.next_batch(batch_size)
        _, step = sess.run([train_op, global_step], feed_dict={x: batch[0], y_: batch[1]})


      print "Training complete"
      print(sess.run(accuracy, feed_dict={x: mnist.test.images, y_: mnist.test.labels}))

    print "Processing complete"
    # Ask for all the services to stop.
    sv.stop()

if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.register("type", "bool", lambda v: v.lower() == "true")
  # Flags for defining the tf.train.ClusterSpec
  parser.add_argument(
      "--hosts",
      type=str,
      default="",
      help="Comma-separated list of hostname:port pairs"
  )
  # Flags for defining the tf.train.Server
  parser.add_argument(
      "--task_index",
      type=int,
      default=0,
      help="Index of task within the job"
  )
  parser.add_argument(
      "--steps",
      type=int,
      default=100,
      help="Number of training steps"
  )
  FLAGS, unparsed = parser.parse_known_args()
  tf.app.run(main=main, argv=[sys.argv[0]] + unparsed)
