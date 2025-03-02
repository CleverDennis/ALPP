#!/bin/bash
# 提示用户输入姓名
echo -n "please input your name: "
# 读取用户输入的姓名
read name 
# 直到用户输入的姓名为 "cosmos" 时停止循环
until [ "$name" = "cosmos" ]; do
    # 提示用户重新输入姓名
    echo -n "用户名错误，请重新输入: "
    # 读取用户输入的姓名
    read name
done
# 欢迎用户
echo "欢迎, $name!"