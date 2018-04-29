node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 784
        }
      }
    }
  }
}
node {
  name: "Placeholder_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "reshape/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377\034\000\000\000\034\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "reshape/Reshape"
  op: "Reshape"
  input: "Placeholder"
  input: "reshape/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1/truncated_normal/mul"
  op: "Mul"
  input: "conv1/truncated_normal/TruncatedNormal"
  input: "conv1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/truncated_normal"
  op: "Add"
  input: "conv1/truncated_normal/mul"
  input: "conv1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/Variable/Assign"
  op: "Assign"
  input: "conv1/Variable"
  input: "conv1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/Variable/read"
  op: "Identity"
  input: "conv1/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "conv1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv1/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/Variable_1/Assign"
  op: "Assign"
  input: "conv1/Variable_1"
  input: "conv1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/Variable_1/read"
  op: "Identity"
  input: "conv1/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
}
node {
  name: "conv1/Conv2D"
  op: "Conv2D"
  input: "reshape/Reshape"
  input: "conv1/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/add"
  op: "Add"
  input: "conv1/Conv2D"
  input: "conv1/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/Relu"
  op: "Relu"
  input: "conv1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pool1/MaxPool"
  op: "MaxPool"
  input: "conv1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "conv2/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv2/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv2/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2/truncated_normal/mul"
  op: "Mul"
  input: "conv2/truncated_normal/TruncatedNormal"
  input: "conv2/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/truncated_normal"
  op: "Add"
  input: "conv2/truncated_normal/mul"
  input: "conv2/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/Variable/Assign"
  op: "Assign"
  input: "conv2/Variable"
  input: "conv2/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/Variable/read"
  op: "Identity"
  input: "conv2/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
}
node {
  name: "conv2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv2/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/Variable_1/Assign"
  op: "Assign"
  input: "conv2/Variable_1"
  input: "conv2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/Variable_1/read"
  op: "Identity"
  input: "conv2/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
}
node {
  name: "conv2/Conv2D"
  op: "Conv2D"
  input: "pool1/MaxPool"
  input: "conv2/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/add"
  op: "Add"
  input: "conv2/Conv2D"
  input: "conv2/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/Relu"
  op: "Relu"
  input: "conv2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pool2/MaxPool"
  op: "MaxPool"
  input: "conv2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "fc1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\014\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "fc1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "fc1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "fc1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc1/truncated_normal/mul"
  op: "Mul"
  input: "fc1/truncated_normal/TruncatedNormal"
  input: "fc1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc1/truncated_normal"
  op: "Add"
  input: "fc1/truncated_normal/mul"
  input: "fc1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc1/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/Variable/Assign"
  op: "Assign"
  input: "fc1/Variable"
  input: "fc1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/Variable/read"
  op: "Identity"
  input: "fc1/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
}
node {
  name: "fc1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "fc1/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/Variable_1/Assign"
  op: "Assign"
  input: "fc1/Variable_1"
  input: "fc1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/Variable_1/read"
  op: "Identity"
  input: "fc1/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
}
node {
  name: "fc1/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377@\014\000\000"
      }
    }
  }
}
node {
  name: "fc1/Reshape"
  op: "Reshape"
  input: "pool2/MaxPool"
  input: "fc1/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/MatMul"
  op: "MatMul"
  input: "fc1/Reshape"
  input: "fc1/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fc1/add"
  op: "Add"
  input: "fc1/MatMul"
  input: "fc1/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc1/Relu"
  op: "Relu"
  input: "fc1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc2/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "fc2/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "fc2/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "fc2/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc2/truncated_normal/mul"
  op: "Mul"
  input: "fc2/truncated_normal/TruncatedNormal"
  input: "fc2/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc2/truncated_normal"
  op: "Add"
  input: "fc2/truncated_normal/mul"
  input: "fc2/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc2/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/Variable/Assign"
  op: "Assign"
  input: "fc2/Variable"
  input: "fc2/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/Variable/read"
  op: "Identity"
  input: "fc2/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
}
node {
  name: "fc2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "fc2/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/Variable_1/Assign"
  op: "Assign"
  input: "fc2/Variable_1"
  input: "fc2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/Variable_1/read"
  op: "Identity"
  input: "fc2/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
}
node {
  name: "fc2/MatMul"
  op: "MatMul"
  input: "fc1/Relu"
  input: "fc2/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fc2/add"
  op: "Add"
  input: "fc2/MatMul"
  input: "fc2/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/xentropy/Shape"
  op: "Shape"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  op: "SparseSoftmaxCrossEntropyWithLogits"
  input: "fc2/add"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlabels"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/values/shape"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Mul"
  op: "Mul"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  input: "loss/sparse_softmax_cross_entropy_loss/Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Const_1"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Sum"
  op: "Sum"
  input: "loss/sparse_softmax_cross_entropy_loss/Mul"
  input: "loss/sparse_softmax_cross_entropy_loss/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/Equal/y"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/Equal"
  op: "Equal"
  input: "loss/sparse_softmax_cross_entropy_loss/Const"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/zeros_like/shape_as_tensor"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/zeros_like/Const"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/zeros_like"
  op: "Fill"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/zeros_like/shape_as_tensor"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/zeros_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/ones_like/Shape"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/ones_like/Const"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/ones_like"
  op: "Fill"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/ones_like/Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/Select"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/Equal"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/zeros_like"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/values/shape"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/Shape"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  input: "^loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  input: "^loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like"
  op: "Fill"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights"
  op: "Mul"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/Select"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present/Const"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/num_present"
  op: "Sum"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Const_2"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Sum_1"
  op: "Sum"
  input: "loss/sparse_softmax_cross_entropy_loss/Sum"
  input: "loss/sparse_softmax_cross_entropy_loss/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Greater/y"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Greater"
  op: "Greater"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present"
  input: "loss/sparse_softmax_cross_entropy_loss/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Equal/y"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Equal"
  op: "Equal"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present"
  input: "loss/sparse_softmax_cross_entropy_loss/Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/ones_like/Shape"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/ones_like/Const"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/ones_like"
  op: "Fill"
  input: "loss/sparse_softmax_cross_entropy_loss/ones_like/Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/Select"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/Equal"
  input: "loss/sparse_softmax_cross_entropy_loss/ones_like"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/div"
  op: "RealDiv"
  input: "loss/sparse_softmax_cross_entropy_loss/Sum_1"
  input: "loss/sparse_softmax_cross_entropy_loss/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/zeros_like/shape_as_tensor"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/zeros_like/Const"
  op: "Const"
  input: "^loss/sparse_softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/zeros_like"
  op: "Fill"
  input: "loss/sparse_softmax_cross_entropy_loss/zeros_like/shape_as_tensor"
  input: "loss/sparse_softmax_cross_entropy_loss/zeros_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/sparse_softmax_cross_entropy_loss/value"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/Greater"
  input: "loss/sparse_softmax_cross_entropy_loss/div"
  input: "loss/sparse_softmax_cross_entropy_loss/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Mean"
  op: "Mean"
  input: "loss/sparse_softmax_cross_entropy_loss/value"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/Fill"
  op: "Fill"
  input: "adam_optimizer/gradients/Shape"
  input: "adam_optimizer/gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/Fill"
  input: "adam_optimizer/gradients/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/Mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/Mean_grad/Tile"
  op: "Tile"
  input: "adam_optimizer/gradients/Mean_grad/Reshape"
  input: "adam_optimizer/gradients/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/Mean_grad/truediv"
  op: "RealDiv"
  input: "adam_optimizer/gradients/Mean_grad/Tile"
  input: "adam_optimizer/gradients/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like"
  op: "Fill"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like/shape_as_tensor"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/Greater"
  input: "adam_optimizer/gradients/Mean_grad/truediv"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select_1"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/Greater"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/zeros_like"
  input: "adam_optimizer/gradients/Mean_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select_1"
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select_1"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/Select_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Shape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/RealDiv"
  op: "RealDiv"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/control_dependency"
  input: "loss/sparse_softmax_cross_entropy_loss/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/RealDiv"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Neg"
  op: "Neg"
  input: "loss/sparse_softmax_cross_entropy_loss/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Neg"
  input: "loss/sparse_softmax_cross_entropy_loss/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/RealDiv_1"
  input: "loss/sparse_softmax_cross_entropy_loss/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/mul"
  op: "Mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/value_grad/tuple/control_dependency"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Sum_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape_1"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/control_dependency"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Tile"
  op: "Tile"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like"
  op: "Fill"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like/shape_as_tensor"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/Equal"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/control_dependency_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select_1"
  op: "Select"
  input: "loss/sparse_softmax_cross_entropy_loss/Equal"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/zeros_like"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/div_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select_1"
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select_1"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/Select_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_1_grad/Tile"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Shape"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/Mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Tile"
  op: "Tile"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Shape"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Shape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Mul"
  op: "Mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Tile"
  input: "loss/sparse_softmax_cross_entropy_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Mul_1"
  op: "Mul"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Mul_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Sum_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape_1"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Select_grad/tuple/control_dependency_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Shape"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Tile"
  op: "Tile"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape_1"
  op: "Shape"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Mul"
  op: "Mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Tile"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Mul_1"
  op: "Mul"
  input: "loss/sparse_softmax_cross_entropy_loss/num_present/Select"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Mul_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Sum_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1"
  input: "^adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/control_dependency_1"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/zeros_like"
  op: "ZerosLike"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/PreventGradient"
  op: "PreventGradient"
  input: "loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "message"
    value {
      s: "Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation\'s interaction with tf.gradients()"
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/ExpandDims"
  op: "ExpandDims"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/Mul_grad/tuple/control_dependency"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/mul"
  op: "Mul"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/ExpandDims"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/PreventGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/Shape"
  op: "Shape"
  input: "fc2/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/fc2/add_grad/Shape"
  input: "adam_optimizer/gradients/fc2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/mul"
  input: "adam_optimizer/gradients/fc2/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/fc2/add_grad/Sum"
  input: "adam_optimizer/gradients/fc2/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/loss/sparse_softmax_cross_entropy_loss/xentropy/xentropy_grad/mul"
  input: "adam_optimizer/gradients/fc2/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/fc2/add_grad/Sum_1"
  input: "adam_optimizer/gradients/fc2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/fc2/add_grad/Reshape"
  input: "^adam_optimizer/gradients/fc2/add_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/fc2/add_grad/Reshape"
  input: "^adam_optimizer/gradients/fc2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc2/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/fc2/add_grad/Reshape_1"
  input: "^adam_optimizer/gradients/fc2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc2/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "adam_optimizer/gradients/fc2/add_grad/tuple/control_dependency"
  input: "fc2/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "fc1/Relu"
  input: "adam_optimizer/gradients/fc2/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/fc2/MatMul_grad/MatMul"
  input: "^adam_optimizer/gradients/fc2/MatMul_grad/MatMul_1"
}
node {
  name: "adam_optimizer/gradients/fc2/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/fc2/MatMul_grad/MatMul"
  input: "^adam_optimizer/gradients/fc2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc2/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc2/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/fc2/MatMul_grad/MatMul_1"
  input: "^adam_optimizer/gradients/fc2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc2/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "adam_optimizer/gradients/fc2/MatMul_grad/tuple/control_dependency"
  input: "fc1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/Shape"
  op: "Shape"
  input: "fc1/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1024
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/fc1/add_grad/Shape"
  input: "adam_optimizer/gradients/fc1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/fc1/Relu_grad/ReluGrad"
  input: "adam_optimizer/gradients/fc1/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/fc1/add_grad/Sum"
  input: "adam_optimizer/gradients/fc1/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/fc1/Relu_grad/ReluGrad"
  input: "adam_optimizer/gradients/fc1/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/fc1/add_grad/Sum_1"
  input: "adam_optimizer/gradients/fc1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/fc1/add_grad/Reshape"
  input: "^adam_optimizer/gradients/fc1/add_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/fc1/add_grad/Reshape"
  input: "^adam_optimizer/gradients/fc1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc1/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/fc1/add_grad/Reshape_1"
  input: "^adam_optimizer/gradients/fc1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc1/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "adam_optimizer/gradients/fc1/add_grad/tuple/control_dependency"
  input: "fc1/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "fc1/Reshape"
  input: "adam_optimizer/gradients/fc1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/fc1/MatMul_grad/MatMul"
  input: "^adam_optimizer/gradients/fc1/MatMul_grad/MatMul_1"
}
node {
  name: "adam_optimizer/gradients/fc1/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/fc1/MatMul_grad/MatMul"
  input: "^adam_optimizer/gradients/fc1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc1/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/fc1/MatMul_grad/MatMul_1"
  input: "^adam_optimizer/gradients/fc1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/fc1/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/Reshape_grad/Shape"
  op: "Shape"
  input: "pool2/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/fc1/Reshape_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/fc1/MatMul_grad/tuple/control_dependency"
  input: "adam_optimizer/gradients/fc1/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/pool2/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv2/Relu"
  input: "pool2/MaxPool"
  input: "adam_optimizer/gradients/fc1/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "adam_optimizer/gradients/pool2/MaxPool_grad/MaxPoolGrad"
  input: "conv2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/Shape"
  op: "Shape"
  input: "conv2/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/conv2/add_grad/Shape"
  input: "adam_optimizer/gradients/conv2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/conv2/Relu_grad/ReluGrad"
  input: "adam_optimizer/gradients/conv2/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/conv2/add_grad/Sum"
  input: "adam_optimizer/gradients/conv2/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/conv2/Relu_grad/ReluGrad"
  input: "adam_optimizer/gradients/conv2/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/conv2/add_grad/Sum_1"
  input: "adam_optimizer/gradients/conv2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/conv2/add_grad/Reshape"
  input: "^adam_optimizer/gradients/conv2/add_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/conv2/add_grad/Reshape"
  input: "^adam_optimizer/gradients/conv2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv2/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/conv2/add_grad/Reshape_1"
  input: "^adam_optimizer/gradients/conv2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv2/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "pool1/MaxPool"
  input: "conv2/Variable/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "adam_optimizer/gradients/conv2/Conv2D_grad/ShapeN"
  input: "conv2/Variable/read"
  input: "adam_optimizer/gradients/conv2/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "pool1/MaxPool"
  input: "adam_optimizer/gradients/conv2/Conv2D_grad/Const"
  input: "adam_optimizer/gradients/conv2/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
  input: "^adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
  input: "^adam_optimizer/gradients/conv2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv2/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^adam_optimizer/gradients/conv2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/pool1/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv1/Relu"
  input: "pool1/MaxPool"
  input: "adam_optimizer/gradients/conv2/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "adam_optimizer/gradients/pool1/MaxPool_grad/MaxPoolGrad"
  input: "conv1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/Shape"
  op: "Shape"
  input: "conv1/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "adam_optimizer/gradients/conv1/add_grad/Shape"
  input: "adam_optimizer/gradients/conv1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/Sum"
  op: "Sum"
  input: "adam_optimizer/gradients/conv1/Relu_grad/ReluGrad"
  input: "adam_optimizer/gradients/conv1/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/Reshape"
  op: "Reshape"
  input: "adam_optimizer/gradients/conv1/add_grad/Sum"
  input: "adam_optimizer/gradients/conv1/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/Sum_1"
  op: "Sum"
  input: "adam_optimizer/gradients/conv1/Relu_grad/ReluGrad"
  input: "adam_optimizer/gradients/conv1/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/Reshape_1"
  op: "Reshape"
  input: "adam_optimizer/gradients/conv1/add_grad/Sum_1"
  input: "adam_optimizer/gradients/conv1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/conv1/add_grad/Reshape"
  input: "^adam_optimizer/gradients/conv1/add_grad/Reshape_1"
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/conv1/add_grad/Reshape"
  input: "^adam_optimizer/gradients/conv1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv1/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/conv1/add_grad/Reshape_1"
  input: "^adam_optimizer/gradients/conv1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv1/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "reshape/Reshape"
  input: "conv1/Variable/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "adam_optimizer/gradients/conv1/Conv2D_grad/ShapeN"
  input: "conv1/Variable/read"
  input: "adam_optimizer/gradients/conv1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "reshape/Reshape"
  input: "adam_optimizer/gradients/conv1/Conv2D_grad/Const"
  input: "adam_optimizer/gradients/conv1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
  input: "^adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
  input: "^adam_optimizer/gradients/conv1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "adam_optimizer/gradients/conv1/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
  input: "^adam_optimizer/gradients/conv1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@adam_optimizer/gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "adam_optimizer/beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.899999976158
      }
    }
  }
}
node {
  name: "adam_optimizer/beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "adam_optimizer/beta1_power/Assign"
  op: "Assign"
  input: "adam_optimizer/beta1_power"
  input: "adam_optimizer/beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/beta1_power/read"
  op: "Identity"
  input: "adam_optimizer/beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "adam_optimizer/beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "adam_optimizer/beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "adam_optimizer/beta2_power/Assign"
  op: "Assign"
  input: "adam_optimizer/beta2_power"
  input: "adam_optimizer/beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/beta2_power/read"
  op: "Identity"
  input: "adam_optimizer/beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "conv1/Variable/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv1/Variable/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/Variable/Adam/Initializer/zeros"
  op: "Fill"
  input: "conv1/Variable/Adam/Initializer/zeros/shape_as_tensor"
  input: "conv1/Variable/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv1/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/Variable/Adam/Assign"
  op: "Assign"
  input: "conv1/Variable/Adam"
  input: "conv1/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/Variable/Adam/read"
  op: "Identity"
  input: "conv1/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "conv1/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv1/Variable/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/Variable/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "conv1/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "conv1/Variable/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv1/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/Variable/Adam_1/Assign"
  op: "Assign"
  input: "conv1/Variable/Adam_1"
  input: "conv1/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/Variable/Adam_1/read"
  op: "Identity"
  input: "conv1/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "conv1/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "conv1/Variable_1/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/Variable_1/Adam/Initializer/zeros"
  op: "Fill"
  input: "conv1/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  input: "conv1/Variable_1/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv1/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/Variable_1/Adam/Assign"
  op: "Assign"
  input: "conv1/Variable_1/Adam"
  input: "conv1/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/Variable_1/Adam/read"
  op: "Identity"
  input: "conv1/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
}
node {
  name: "conv1/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "conv1/Variable_1/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/Variable_1/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "conv1/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "conv1/Variable_1/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv1/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "conv1/Variable_1/Adam_1"
  input: "conv1/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/Variable_1/Adam_1/read"
  op: "Identity"
  input: "conv1/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
}
node {
  name: "conv2/Variable/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/Variable/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/Variable/Adam/Initializer/zeros"
  op: "Fill"
  input: "conv2/Variable/Adam/Initializer/zeros/shape_as_tensor"
  input: "conv2/Variable/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/Variable/Adam/Assign"
  op: "Assign"
  input: "conv2/Variable/Adam"
  input: "conv2/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/Variable/Adam/read"
  op: "Identity"
  input: "conv2/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
}
node {
  name: "conv2/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/Variable/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/Variable/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "conv2/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "conv2/Variable/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/Variable/Adam_1/Assign"
  op: "Assign"
  input: "conv2/Variable/Adam_1"
  input: "conv2/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/Variable/Adam_1/read"
  op: "Identity"
  input: "conv2/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
}
node {
  name: "conv2/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "conv2/Variable_1/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/Variable_1/Adam/Initializer/zeros"
  op: "Fill"
  input: "conv2/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  input: "conv2/Variable_1/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/Variable_1/Adam/Assign"
  op: "Assign"
  input: "conv2/Variable_1/Adam"
  input: "conv2/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/Variable_1/Adam/read"
  op: "Identity"
  input: "conv2/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
}
node {
  name: "conv2/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "conv2/Variable_1/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/Variable_1/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "conv2/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "conv2/Variable_1/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "conv2/Variable_1/Adam_1"
  input: "conv2/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/Variable_1/Adam_1/read"
  op: "Identity"
  input: "conv2/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
}
node {
  name: "fc1/Variable/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\014\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "fc1/Variable/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/Variable/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc1/Variable/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc1/Variable/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/Variable/Adam/Assign"
  op: "Assign"
  input: "fc1/Variable/Adam"
  input: "fc1/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/Variable/Adam/read"
  op: "Identity"
  input: "fc1/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
}
node {
  name: "fc1/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\014\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "fc1/Variable/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/Variable/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc1/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc1/Variable/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/Variable/Adam_1/Assign"
  op: "Assign"
  input: "fc1/Variable/Adam_1"
  input: "fc1/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/Variable/Adam_1/read"
  op: "Identity"
  input: "fc1/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
}
node {
  name: "fc1/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1024
      }
    }
  }
}
node {
  name: "fc1/Variable_1/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/Variable_1/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc1/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc1/Variable_1/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/Variable_1/Adam/Assign"
  op: "Assign"
  input: "fc1/Variable_1/Adam"
  input: "fc1/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/Variable_1/Adam/read"
  op: "Identity"
  input: "fc1/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
}
node {
  name: "fc1/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1024
      }
    }
  }
}
node {
  name: "fc1/Variable_1/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/Variable_1/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc1/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc1/Variable_1/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "fc1/Variable_1/Adam_1"
  input: "fc1/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/Variable_1/Adam_1/read"
  op: "Identity"
  input: "fc1/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
}
node {
  name: "fc2/Variable/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "fc2/Variable/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/Variable/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc2/Variable/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc2/Variable/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc2/Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/Variable/Adam/Assign"
  op: "Assign"
  input: "fc2/Variable/Adam"
  input: "fc2/Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/Variable/Adam/read"
  op: "Identity"
  input: "fc2/Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
}
node {
  name: "fc2/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "fc2/Variable/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/Variable/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc2/Variable/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc2/Variable/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc2/Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/Variable/Adam_1/Assign"
  op: "Assign"
  input: "fc2/Variable/Adam_1"
  input: "fc2/Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/Variable/Adam_1/read"
  op: "Identity"
  input: "fc2/Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
}
node {
  name: "fc2/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "fc2/Variable_1/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/Variable_1/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc2/Variable_1/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc2/Variable_1/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc2/Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/Variable_1/Adam/Assign"
  op: "Assign"
  input: "fc2/Variable_1/Adam"
  input: "fc2/Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/Variable_1/Adam/read"
  op: "Identity"
  input: "fc2/Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
}
node {
  name: "fc2/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "fc2/Variable_1/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/Variable_1/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc2/Variable_1/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc2/Variable_1/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc2/Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "fc2/Variable_1/Adam_1"
  input: "fc2/Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/Variable_1/Adam_1/read"
  op: "Identity"
  input: "fc2/Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999974738e-05
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.899999976158
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993923e-09
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_conv1/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "conv1/Variable"
  input: "conv1/Variable/Adam"
  input: "conv1/Variable/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/conv1/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_conv1/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "conv1/Variable_1"
  input: "conv1/Variable_1/Adam"
  input: "conv1/Variable_1/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/conv1/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_conv2/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "conv2/Variable"
  input: "conv2/Variable/Adam"
  input: "conv2/Variable/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/conv2/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_conv2/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "conv2/Variable_1"
  input: "conv2/Variable_1/Adam"
  input: "conv2/Variable_1/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/conv2/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_fc1/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "fc1/Variable"
  input: "fc1/Variable/Adam"
  input: "fc1/Variable/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/fc1/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_fc1/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "fc1/Variable_1"
  input: "fc1/Variable_1/Adam"
  input: "fc1/Variable_1/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/fc1/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_fc2/Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "fc2/Variable"
  input: "fc2/Variable/Adam"
  input: "fc2/Variable/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/fc2/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/update_fc2/Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "fc2/Variable_1"
  input: "fc2/Variable_1/Adam"
  input: "fc2/Variable_1/Adam_1"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/learning_rate"
  input: "adam_optimizer/Adam/beta1"
  input: "adam_optimizer/Adam/beta2"
  input: "adam_optimizer/Adam/epsilon"
  input: "adam_optimizer/gradients/fc2/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "adam_optimizer/Adam/mul"
  op: "Mul"
  input: "adam_optimizer/beta1_power/read"
  input: "adam_optimizer/Adam/beta1"
  input: "^adam_optimizer/Adam/update_conv1/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv1/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv2/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv2/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc1/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc1/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc2/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc2/Variable_1/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/Assign"
  op: "Assign"
  input: "adam_optimizer/beta1_power"
  input: "adam_optimizer/Adam/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/Adam/mul_1"
  op: "Mul"
  input: "adam_optimizer/beta2_power/read"
  input: "adam_optimizer/Adam/beta2"
  input: "^adam_optimizer/Adam/update_conv1/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv1/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv2/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv2/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc1/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc1/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc2/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc2/Variable_1/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
}
node {
  name: "adam_optimizer/Adam/Assign_1"
  op: "Assign"
  input: "adam_optimizer/beta2_power"
  input: "adam_optimizer/Adam/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "adam_optimizer/Adam"
  op: "NoOp"
  input: "^adam_optimizer/Adam/update_conv1/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv1/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv2/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_conv2/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc1/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc1/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc2/Variable/ApplyAdam"
  input: "^adam_optimizer/Adam/update_fc2/Variable_1/ApplyAdam"
  input: "^adam_optimizer/Adam/Assign"
  input: "^adam_optimizer/Adam/Assign_1"
}
versions {
  producer: 26
}
