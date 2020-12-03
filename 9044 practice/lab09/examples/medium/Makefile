# Makefile generated at 2020年 8月 1日 星期六 18时52分55秒 AEST

CC = gcc
CFLAGS = -Wall -g

main:  a.o aaa.o b.o bb.o c.o main.o 
	$(CC) $(CFLAGS) -o $@ a.o aaa.o b.o bb.o c.o main.o 

bb.o: bb.c aaa.h bb.h 
c.o: c.c c.h 
b.o: b.c b.h aaa.h bb.h 
main.o: main.c bb.h a.h b.h aaa.h c.h 
a.o: a.c common.h a.h 
