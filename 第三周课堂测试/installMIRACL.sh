#!/bin/bash
# 定义变量
MIRACL_DIR="$HOME/MIRACL"
STUDENT_ID="20242936" 
STUDENT_MIRACL_DIR="$HOME/${STUDENT_ID}MIRACL"
DOWNLOAD_DIR="$HOME" 
if [ -d "$MIRACL_DIR" ]; then
echo "MIRACL已经安装在 $MIRACL_DIR 目录。"
echo "正在下载MIRACL源代码到主目录..."
else
echo "MIRACL未安装，开始安装过程..."
mkdir -p "$MIRACL_DIR"
cd "$MIRACL_DIR" || exit
# 下载并解压MIRACL
wget https://github.com/miracl/MIRACL/archive/refs/heads/master.zip
unzip -j -aa -L master.zip
rm master.zip
# 编译MIRACL库
chmod 777 linux64
./linux64
echo "MIRACL安装完成。"
fi
# 下载MIRACL源代码到主目录
cd "$DOWNLOAD_DIR" || exit
wget https://github.com/miracl/MIRACL/archive/refs/heads/master.zip
unzip -d "$STUDENT_MIRACL_DIR" master.zip
mv "$STUDENT_MIRACL_DIR/MIRACL-master"/* "$STUDENT_MIRACL_DIR"
rmdir "$STUDENT_MIRACL_DIR/MIRACL-master"
rm master.zip
echo "MIRACL源代码已下载并解压到 $STUDENT_MIRACL_DIR"
# 确保testmiracl.c能正确运行
if [ -f "$MIRACL_DIR/testmiracl.c" ]; then
gcc -o testmiracl "$MIRACL_DIR/testmiracl.c" -L"$MIRACL_DIR" -lmiracl
if [ -f "./testmiracl" ]; then
echo "testmiracl.c 编译成功，正在运行..."
./testmiracl
else
echo "testmiracl.c 编译失败。"
fi
else
echo "testmiracl.c 文件不存在。"
fi