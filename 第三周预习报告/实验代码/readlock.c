#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd;
    struct flock lock, savelock;

    fd = open("book.dat", O_RDONLY);
    lock.l_type = F_RDLCK;    // 请求读锁
    lock.l_start = 0;
    lock.l_whence = SEEK_SET;
    lock.l_len = 50;          // 锁定前50字节

    savelock = lock;
    fcntl(fd, F_GETLK, &lock);
    if (lock.l_type == F_WRLCK) {
        printf("File is write-locked by process %d\n", lock.l_pid);
        exit(1);
    }

    fcntl(fd, F_SETLK, &savelock); // 设置读锁
    pause();
    close(fd);
    return 0;
}