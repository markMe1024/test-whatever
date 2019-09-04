#### 什么是Shell脚本？
1. 将多条Linux命令组合在一个文件中，这个文件就是Shell脚本。

#### 为什么要用Shell脚本？
1. 可以一次执行多条Linux命令。
2. 为了解决一个问题编写的Shell脚本，可以多次多处重复执行。

#### 语法
1. 在Linux中，Shell脚本通常以`.sh`作为件扩展名。
2. Shell脚本中，命令按行解释。如果想在同一行执行多条命令，可以在命令之间加上分号。
3. 通过命令`cat /etc/shells`可以查看系统下支持的Shell类型，通常我们使用bash。用bash写Shell脚本，脚本第一行需要加上`#!/bin/bash`。
4. 执行bash脚本，可以`bash + shell-script.sh`或者`./shell-script.sh`，都行。