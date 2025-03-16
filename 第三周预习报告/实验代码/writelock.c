#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd;
    struct flock lock, savelock;

    fd = open("book.dat", O_RDWR);
    lock.l_type = F_WRLCK;    // 请求写锁
    lock.l_start = 0;
    lock.l_whence = SEEK_SET;
    lock.l_len = 0;           // 锁定整个文件

    savelock = lock;
    fcntl(fd, F_GETLK, &lock); // 检查是否有锁
    if (lock.l_type == F_WRLCK || lock.l_type == F_RDLCK) {
        printf("File is locked by process %d\n", lock.l_pid);
        exit(1);
    } else {
        fcntl(fd, F_SETLK, &savelock); // 设置写锁
    }

    pause(); // 保持锁状态
    close(fd);
    return 0;
}