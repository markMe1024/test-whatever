#### Shell

1. 查看当前系统支持的shell: `cat /etc/shells`

#### 变量

1. 设置变量：`var=123` (等号左右无空格)
2. 取变量值：`$var`
3. 打印变量到控制台：`echo $var`

#### 文件和文件夹

1. 新建文件夹：`mkdir + dirname`
2. 删除文件夹：`rm -rf + dirname`
3. 创建新文件，使用vim编辑器：`vi + filename`
4. 删除文件：`rm filename`

#### Parameter substitution

1. 反引号内表示可执行命令：
   1. `echo expr 1 + 2`：打印出"expr 1 + 2"
   2. `` echo `expr 1 + 2` ``：打印出3