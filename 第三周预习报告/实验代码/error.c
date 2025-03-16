#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd = open("/root/noexitfile", O_WRONLY);
    if (fd == -1) {
        perror("Failed to open /root/noexitfile");
    }
    return 0;
}