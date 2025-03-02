#!/bin/bash
# 定义一个数组
array=(jerry tom alice keven julie)
# 初始化索引为0
index=0
# 当索引小于数组长度时循环
while [ $index -lt ${#array[@]} ]; do
    # 输出数组当前索引的值
    echo "array[$index]=${array[$index]}"
    # 索引加1
    index=$((index+1))
done
# 输出整个数组
echo "all array is ${array[*]}"
# 定义第二个数组并赋值
array2[10]="hello"
array2[20]="world"
# 输出第二个数组的值
echo "array2[10]=${array2[10]}"
echo "array2[15]=${array2[15]}"
echo "array2[20]=${array2[20]}"
# 退出脚本
exit 0