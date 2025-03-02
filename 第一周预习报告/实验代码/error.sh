#!/bin/bash
# 初始化变量a为37
a=37  # 修正变量赋值时的空格错误
# 如果变量a大于27
if [ $a -gt 27 ]; then
    # 输出变量a的值
    echo $a
fi
# 退出脚本，返回状态码0
exit 0