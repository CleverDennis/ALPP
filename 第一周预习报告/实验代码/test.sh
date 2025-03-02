#!/bin/bash
# 指定脚本使用的解释器为 bash

DEFAULT_FILE_NAME="generic.data"
# 定义一个默认的文件名变量

file_name=${1:-$DEFAULT_FILE_NAME}
# 如果第一个参数存在，则使用第一个参数作为文件名，否则使用默认文件名

echo ${file_name}
# 输出文件名