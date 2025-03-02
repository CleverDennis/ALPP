#!/bin/bash

# 定义一个函数 max
max() {
    # 检查参数数量是否为3
    if [ $# -ne 3 ]; then
        echo "usage: max p1 p2 p3"
        return 1  # 使用 return 替代 exit，避免直接退出终端
    fi

    # 初始化 max 为第一个参数
    local max_val=$1  # 使用 local 声明局部变量

    # 比较第二个参数
    if [ "$max_val" -lt "$2" ]; then  # 修复缺少空格和变量引用
        max_val=$2
    fi

    # 比较第三个参数
    if [ "$max_val" -lt "$3" ]; then  # 修复 $3 后缺少空格的问题
        max_val=$3
    fi

    # 输出最大值
    echo "$max_val"
}

# 调用函数并获取结果
result=$(max 1 2 3)

# 输出结果
echo "The max number of 1, 2, 3 is: $result"