# Makefile generated at 2020年 8月 1日 星期六 17时53分59秒 AEST

CC = gcc
CFLAGS = -Wall -g

easymain:  easymain.o graphics.o world.o 
	$(CC) $(CFLAGS) -o $@ easymain.o graphics.o world.o 

easymain.o: easymain.c graphics.h world.h 
world.o: world.c world.h 
graphics.o: graphics.c graphics.h world.h 
