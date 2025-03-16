#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

int main() {
    int fd = open("a.txt", O_RDWR);
    if (fd == -1) {
        perror("open failed");
        exit(1);
    }

    // 移动文件指针到指定位置
    off_t oldpos = lseek(fd, strlen("abcdefghijklm1"), SEEK_SET);
    if (oldpos == -1) {
        perror("lseek failed");
        close(fd);
        exit(1);
    }

    // 写入数据
    const char *data = "uuuuu";
    ssize_t result = write(fd, data, strlen(data));
    if (result == -1) {
        perror("write failed");
    }

    close(fd);
    return 0;
}