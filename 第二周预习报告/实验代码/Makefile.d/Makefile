#Makefile
main:main.o hello1.o hello2.o
	gcc -o main main.o hello1.o hello2.o
main.o:main.c hello1.h hello2.h
	gcc -c main.c
hello 1.o:hello 1.c hello 1.h
	gcc-c hello1.c
hello2.o:hello2.c hello2.h
	gcc -c hello2.c
clean:
	rm main hello1.o hello2.o main.o