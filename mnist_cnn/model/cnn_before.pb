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
versions {
  producer: 26
}
