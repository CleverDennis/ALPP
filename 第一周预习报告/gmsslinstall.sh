#!/bin/bash

# 目录名称
GmDIR="GmSSL-3.1.1-Linux"

# 检查目录是否存在
if [ -d "$GmDIR" ]; then
    echo "已经安装了GmSSL，脚本将退出。"
    exit 0
fi

# 文件名称
FILE="GmSSL-Linux.sh"
URL="https://github.com/guanzhi/GmSSL/releases/download/v3.1.1/GmSSL-3.1.1-Linux.sh"
TEMP_FILE="GmSSL-3.1.1-Linux.sh"

# 检查文件是否存在
if [ ! -f "$FILE" ]; then
    # 下载并重命名文件
    wget -O "$TEMP_FILE" "$URL"
    mv "$TEMP_FILE" "$FILE"

fi

cp ./GmSSL-Linux.sh ~
cd ~
./GmSSL-Linux.sh 

echo "安装GmSSL成功"

echo 'export PATH="$HOME/GmSSL-3.1.1-Linux/bin:$PATH"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="$HOME/GmSSL-3.1.1-Linux/lib:$LD_LIBRARY_PATH"' >> ~/.bashrc
. ~/.bashrc
echo "Init GmSSL ENV successfully"

