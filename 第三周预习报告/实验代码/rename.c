#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#define BUFFERSIZE 512

void debug(char *mess, char *param, int n) {
    if (n == -1) {
        perror(mess);
        exit(1);
    }
}

int main(int argc, char **argv) {
    int in_fd, out_fd, n_chars;
    char buf[BUFFERSIZE];

    if (argc != 3) {
        fprintf(stderr, "Usage: %s source destination\n", argv[0]);
        exit(1);
    }

    in_fd = open(argv[1], O_RDONLY);
    debug("Open source failed", argv[1], in_fd);

    out_fd = creat(argv[2], 0744);
    debug("Create destination failed", argv[2], out_fd);

    while ((n_chars = read(in_fd, buf, BUFFERSIZE)) > 0) {
        if (write(out_fd, buf, n_chars) != n_chars) {
            debug("Write failed", argv[2], -1);
        }
    }

    close(in_fd);
    close(out_fd);
    return 0;
}