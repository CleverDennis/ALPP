#!/bin/bash
# 初始化变量x为0
x=0
# 当变量x不等于5时执行循环
while [ "$x" -ne 5 ]; do
    # 输出变量x的值
    echo $x
    # 将变量x的值加1
    x=$(($x+1))
done
# 退出脚本，返回状态码0
exit 0