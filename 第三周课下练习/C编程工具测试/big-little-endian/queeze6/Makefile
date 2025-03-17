# 定义变量
CC = gcc
CFLAGS = -Wall -Iinclude
LDFLAGS = -Llib
LIBS = -lble20242936 -lble  # 修正动态库和静态库名称

# 文件路径
SRCS = src/celibrary.c src/cebitfields.c src/cebitwise.c src/cepointer.c src/ceunion.c
OBJS = $(SRCS:.c=.o)
BIN = bin/main
LIB_STATIC = lib/libble.a
LIB_SHARED = lib/libble20242936.so

# 默认目标
all: dirs $(BIN) $(LIB_STATIC) $(LIB_SHARED)

# 目录创建
dirs:
	mkdir -p bin lib include src docs

# 编译静态库
$(LIB_STATIC): $(OBJS)
	ar rcs $@ $^

# 编译动态库
$(LIB_SHARED): $(OBJS)
	$(CC) -shared -o $@ $^

# 编译主程序（注意依赖顺序）
$(BIN): src/main.c $(LIB_STATIC) $(LIB_SHARED)
	$(CC) $(CFLAGS) -o $@ src/main.c $(LDFLAGS) $(LIBS)  # 确保 LIBS 正确

# 清理
clean:
	rm -rf bin/* lib/* *.o

# 运行程序
run: all
	LD_LIBRARY_PATH=lib ./bin/main bitwise

# 格式化输出
.PHONY: all clean run dirs