#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int file_descriptor;
    char read_buffer[25];
    const char *text1 = "abcdefghi";
    const char *text2 = "0123456789";

    // 创建并写入初始内容
    file_descriptor = creat("testfile", S_IRWXU);
    write(file_descriptor, text1, 10);
    close(file_descriptor);

    // 重新以读写模式打开
    file_descriptor = open("testfile", O_RDWR);
    read(file_descriptor, read_buffer, 24);
    printf("First read: %s\n", read_buffer);

    // 重置指针并设置追加模式
    lseek(file_descriptor, 0, SEEK_SET);
    int flags = fcntl(file_descriptor, F_GETFL);
    flags |= O_APPEND;
    fcntl(file_descriptor, F_SETFL, flags);

    // 追加写入
    write(file_descriptor, text2, 10);
    lseek(file_descriptor, 0, SEEK_SET);
    read(file_descriptor, read_buffer, 24);
    printf("Second read: %s\n", read_buffer);

    close(file_descriptor);
    unlink("testfile");
    return 0;
}