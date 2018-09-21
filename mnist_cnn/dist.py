#!/usr/bin/env python

import argparse
import sys
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data
from simulate import *

# Flags for defining the tf.train.ClusterSpec
tf.app.flags.DEFINE_string("hosts", "","Comma-separated list of hostname:port pairs")

# Flags for defining the tf.train.Server
tf.app.flags.DEFINE_integer("task_index", 0, "Index of task within the job")
tf.app.flags.DEFINE_integer("steps", 100, "Number of training steps")

FLAGS = tf.app.flags.FLAGS
batch_size = 100



def deepnn(x):
  """deepnn builds the graph for a deep net for classifying digits.
  Args:
    x: an input tensor with the dimensions (N_examples, 784), where 784 is the
    number of pixels in a standard MNIST image.
  Returns:
    A tuple (y, keep_prob). y is a tensor of shape (N_examples, 10), with values
    equal to the logits of classifying the digit into one of 10 classes (the
    digits 0-9). keep_prob is a scalar placeholder for the probability of
    dropout.
  """
  # Reshape to use within a convolutional neural net.
  # Last dimension is for "features" - there is only one here, since images are
  # grayscale -- it would be 3 for an RGB image, 4 for RGBA, etc.
  with tf.name_scope('reshape'):
    x_image = tf.reshape(x, [-1, 28, 28, 1])

  # First convolutional layer - maps one grayscale image to 32 feature maps.
  with tf.name_scope('conv1'):
    W_conv1 = weight_variable([5, 5, 1, 32])
    b_conv1 = bias_variable([32])
    h_conv1 = tf.nn.relu(conv2d(x_image, W_conv1) + b_conv1)

  # Pooling layer - downsamples by 2X.
  with tf.name_scope('pool1'):
    h_pool1 = max_pool_2x2(h_conv1)

  # Second convolutional layer -- maps 32 feature maps to 64.
  with tf.name_scope('conv2'):
    W_conv2 = weight_variable([5, 5, 32, 64])
    b_conv2 = bias_variable([64])
    h_conv2 = tf.nn.relu(conv2d(h_pool1, W_conv2) + b_conv2)

  # Second pooling layer.
  with tf.name_scope('pool2'):
    h_pool2 = max_pool_2x2(h_conv2)

  # Fully connected layer 1 -- after 2 round of downsampling, our 28x28 image
  # is down to 7x7x64 feature maps -- maps this to 1024 features.
  with tf.name_scope('fc1'):
    W_fc1 = weight_variable([7 * 7 * 64, 1024])
    b_fc1 = bias_variable([1024])

    h_pool2_flat = tf.reshape(h_pool2, [-1, 7 * 7 * 64])
    h_fc1 = tf.nn.relu(tf.matmul(h_pool2_flat, W_fc1) + b_fc1)

  # Dropout - controls the complexity of the model, prevents co-adaptation of
  # features.
  #with tf.name_scope('dropout'):
  #  keep_prob = tf.placeholder(tf.float32)
  #  h_fc1_drop = tf.nn.dropout(h_fc1, keep_prob)

  # Map the 1024 features to 10 classes, one for each digit
  with tf.name_scope('fc2'):
    W_fc2 = weight_variable([1024, 10])
    b_fc2 = bias_variable([10])

  #  y_conv = tf.matmul(h_fc1_drop, W_fc2) + b_fc2
    y_conv = tf.matmul(h_fc1, W_fc2) + b_fc2
  #return y_conv, keep_prob
  return y_conv
  

def conv2d(x, W):
  """conv2d returns a 2d convolution layer with full stride."""
  return tf.nn.conv2d(x, W, strides=[1, 1, 1, 1], padding='SAME')


def max_pool_2x2(x):
  """max_pool_2x2 downsamples a feature map by 2X."""
  return tf.nn.max_pool(x, ksize=[1, 2, 2, 1],
                        strides=[1, 2, 2, 1], padding='SAME')


def weight_variable(shape):
  """weight_variable generates a weight variable of a given shape."""
  initial = tf.truncated_normal(shape, stddev=0.1)
  return tf.Variable(initial)


def bias_variable(shape):
  """bias_variable generates a bias variable of a given shape."""
  initial = tf.constant(0.1, shape=shape)
  return tf.Variable(initial)







def main(_):
    hosts = FLAGS.hosts.split(",")

    # Create a cluster from the parameter server and worker hosts.
    cluster = tf.train.ClusterSpec({"worker": hosts})

    # Create and start a server for the local task.
    server = tf.train.Server(cluster, job_name="worker", task_index=FLAGS.task_index)

    is_chief = (FLAGS.task_index == 0)


    #create model
    x = tf.placeholder(tf.float32, [None, 784])

    # Define loss and optimizer
    y_ = tf.placeholder(tf.int64, [None])

    # Build the graph for the deep net
    #y_conv, keep_prob = deepnn(x)
    y_conv = deepnn(x)

    with tf.name_scope('loss'):
        cross_entropy = tf.losses.sparse_softmax_cross_entropy(labels=y_, logits=y_conv)
        cross_entropy = tf.reduce_mean(cross_entropy)

    with tf.name_scope('adam_optimizer'):
        train_op = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy)

    with tf.name_scope('accuracy'):
        correct_prediction = tf.equal(tf.argmax(y_conv, 1), y_)
        correct_prediction = tf.cast(correct_prediction, tf.float32)
        accuracy = tf.reduce_mean(correct_prediction)



    if not is_chief:
        server.join()
    else:
        # Partition the graph
        metadata = get_metadata()
        G, span, node_dict = partition(1e11, 5, metadata[0], metadata[1], metadata[2], metadata[3], True, 3.0, 'etf')
        
        #import graph
        graph = tf.get_default_graph() 
        init_op = tf.global_variables_initializer()
        with tf.Session() as sess:
                sess.run(init_op)

        for node in graph.get_operations():
            print(node.name)
            if node.name in node_dict:
                i = G.nodes[node_dict[node.name]]['p']
                node.device = "/job:worker/task:" + str(i - 1)
            else:
                node.device = "/job:worker/task:0"

        summary_op = tf.summary.merge_all()
        global_step = tf.Variable(0)

        mnist = input_data.read_data_sets('MNIST_data', one_hot=True)

        # Create a "supervisor", which oversees the training process.
        sv = tf.train.Supervisor(is_chief=is_chief,
                         logdir="./train_logs",
                         summary_op=summary_op,
                         global_step=global_step)

        print "supervisor created"

        # The supervisor takes care of session initialization, restoring from
        # a checkpoint, and closing when done or an error occurs.
        with sv.managed_session(server.target) as sess:
            # Loop until the supervisor shuts down or 1000000 steps have completed.
            print "Start session"
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
