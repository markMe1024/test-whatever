数据需要先保存到内存中，计算机才能去处理它。内存会被划分为很多小的区域，每个区域拥有唯一的一串数字来代表它，这串数字叫做内存地址。我们可以给每个内存地址一个独一无二的名字，这就是变量。变量可以用来存放不同的值，但是一次只能存一个值。

##### 变量类型

1. 系统变量：由Linux创建和维护，这种变量用大写字母定义。

2. 用户自定义变量：由用户自己创建和维护，这种变量通常用小写字母定义。

##### 定义变量

1. 用户使用形如`name=value`来定义变量。

2. 变量名在`=`左边，变量值在`=`右边。而且，变量名和变量值与`=`紧挨着，中间不能有空格。

3. 变量名由字母、数字、下划线组成，第一个字符只能是字母或下划线。

4. 变量名区分大小写。

##### 取变量值

1. 通过`$ + var_name`来取变量值。