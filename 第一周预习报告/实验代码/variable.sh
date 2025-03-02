#!/bin/bash
# 输出上一个命令的最后一个参数
echo $_
# 输出所有位置参数
echo $*
# 输出上一个命令的退出状态
echo $?
# 输出当前脚本的进程ID
echo $$
# 输出当前脚本的文件名
echo $0
# 输出所有位置参数
echo $@
# 定义一个变量messages并赋值
messages="hello world!"
# 输出变量messages的值
echo $messages
# 输出上一个命令的最后一个参数
echo $_
# 退出脚本
exit