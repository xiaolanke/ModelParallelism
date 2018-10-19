"""A deep MNIST classifier using convolutional layers.
See extensive documentation at
https://www.tensorflow.org/get_started/mnist/pros
"""
# Disable linter warnings to maintain consistency with tutorial.
# pylint: disable=invalid-name
# pylint: disable=g-bad-import-order

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse
import sys
from tensorflow.python.client import timeline
from tensorflow.examples.tutorials.mnist import input_data
import tensorflow as tf

FLAGS = None

# Flags for defining the tf.train.ClusterSpec
tf.app.flags.DEFINE_string("hosts", "",
                           "Comma-separated list of hostname:port pairs")

# Flags for defining the tf.train.Server
tf.app.flags.DEFINE_integer("task_index", 0, "Index of task within the job")
tf.app.flags.DEFINE_integer("steps", 100, "Number of training steps")


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
  server = tf.train.Server(cluster,
                           job_name="worker",
                           task_index=FLAGS.task_index)

  is_chief = (FLAGS.task_index == 0)

  if not is_chief:
    server.join()
  else:
    # Import data
    mnist = input_data.read_data_sets(FLAGS.data_dir)

    # Create the model
    x = tf.placeholder(tf.float32, [None, 784])

    # Define loss and optimizer
    y_ = tf.placeholder(tf.int64, [None])

    # Build the graph for the deep net
    #y_conv, keep_prob = deepnn(x)
    y_conv = deepnn(x)

    with tf.name_scope('loss'):
      cross_entropy = tf.losses.sparse_softmax_cross_entropy(
          labels=y_, logits=y_conv)
    cross_entropy = tf.reduce_mean(cross_entropy)

    #for simulation
    #tf.train.write_graph(tf.get_default_graph(), "model/", "cnn_before.pb", as_text=True) 

    with tf.name_scope('adam_optimizer'):
      train_step = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy)
   
    #for simulation
    #tf.train.write_graph(tf.get_default_graph(), "model/", "cnn_after.pb", as_text=True)

    with tf.name_scope('accuracy'):
      correct_prediction = tf.equal(tf.argmax(y_conv, 1), y_)
      correct_prediction = tf.cast(correct_prediction, tf.float32)
    accuracy = tf.reduce_mean(correct_prediction)

    init_op = tf.global_variables_initializer()

    #random cut
    graph_def = tf.get_default_graph().as_graph_def()
    i = 0
    #for node in graph.get_operations():
    for node in graph_def.node:
      if i == len(hosts):
          i = 0
      node.device = "/job:worker/task:" + str(i)
      i += 1

    tf.import_graph_def(graph_def, name="")

    tf.train.write_graph(tf.get_default_graph(), "model/", "cnn_dist.pb", as_text=True)

    train_writer = tf.summary.FileWriter("./mnist_cnn_logs")
    train_writer.add_graph(tf.get_default_graph())

    # Create a "supervisor", which oversees the training process.
    sv = tf.train.Supervisor(is_chief=is_chief, init_op=init_op)

    print("supervisor created")

    # The supervisor takes care of session initialization, restoring from
    # a checkpoint, and closing when done or an error occurs.
    with sv.managed_session(server.target) as sess:
      # Loop until the supervisor shuts down or 1000000 steps have completed.
      print("Start session")
      for node in tf.get_default_graph().get_operations():
        print(node.device)
      for i in range(100):
        batch = mnist.train.next_batch(100)
        if i % 10 == 0:
          #train_accuracy = accuracy.eval(feed_dict={x: batch[0], y_: batch[1], keep_prob: 1.0})
          train_accuracy = accuracy.eval(session=sess, feed_dict={x: batch[0], y_: batch[1]})
          print('step %d, training accuracy %g' % (i, train_accuracy))
          #train_step.run(feed_dict={x: batch[0], y_: batch[1], keep_prob: 0.5})
          run_options = tf.RunOptions(trace_level=tf.RunOptions.FULL_TRACE)
          run_metadata = tf.RunMetadata()
          sess.run(train_step, feed_dict={x: batch[0], y_: batch[1]}, options=run_options, run_metadata=run_metadata)
          train_writer.add_run_metadata(run_metadata, 'step%03d' % i)
          if i == 50:
            fetched_timeline = timeline.Timeline(run_metadata.step_stats)
            chrome_trace = fetched_timeline.generate_chrome_trace_format()
            with open('timeline.json', 'w') as f:
              f.write(chrome_trace)
            chrome_trace = fetched_timeline.generate_chrome_trace_format(show_memory=True)
            with open('timeline_memory.json', 'w') as f:
              f.write(chrome_trace)
        else:
          sess.run(train_step, feed_dict={x: batch[0], y_: batch[1]})

    print("Processing complete")

if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('--data_dir', type=str,
                      default='mnist',
                      help='Directory for storing input data')
  parser.add_argument('--hosts', type=str,
                      default='Comma-separated list of hostname:port pairs',
                      help='Directory for storing input data')
  parser.add_argument('--task_index', type=int,
                      default=0,
                      help='Index of task within the job')
  FLAGS, unparsed = parser.parse_known_args()
  tf.app.run(main=main, argv=[sys.argv[0]] + unparsed)
