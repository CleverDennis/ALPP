#!/bin/bash
# 初始化变量x为1
x=1
# 当变量x小于或等于5时执行循环
while [ "$x" -le 5 ]; do
    # 输出变量x的值
    echo $x
    # 将变量x的值乘以2
    x=$(expr $x \* 2)
done
# 退出脚本，返回状态码0
exit 0