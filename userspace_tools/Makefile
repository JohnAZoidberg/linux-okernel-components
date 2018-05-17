# Build the user space outer-kernel tools
# C I Dalton 2015


IDIR = 
#IDIR = ../linux/include

CC = gcc
#CFLAGS = -g -Wall -O2 -DDEBUG -I$(IDIR)
CFLAGS = -g -Wall -O2 -DDEBUG 

TARGET1 = okernel_exec
TARGET2 = okernel_test1
TARGET3 = okernel_exec2
TARGET4 = okernel_test2
TARGET5 = okernel_cp1
TARGET6 = okernel_sleep1
TARGET7 = okernel_fork1
TARGET8 = okernel_fork_exec1
TARGET9 = okernel_thread1
TARGET10 = okernel_thread2


all: $(TARGET1) $(TARGET2) $(TARGET3) $(TARGET4) $(TARGET5) $(TARGET6) $(TARGET7) $(TARGET8) $(TARGET9) $(TARGET10)

$(TARGET1): $(TARGET1).c
	$(CC) $(CFLAGS) -o $(TARGET1) $(TARGET1).c

$(TARGET2): $(TARGET2).c
	$(CC) $(CFLAGS) -o $(TARGET2) $(TARGET2).c

$(TARGET3): $(TARGET3).c
	$(CC) $(CFLAGS) -o $(TARGET3) $(TARGET3).c

$(TARGET4): $(TARGET4).c
	$(CC) -static $(CFLAGS) -o $(TARGET4) $(TARGET4).c

$(TARGET5): $(TARGET5).c
	$(CC) -static $(CFLAGS) -o $(TARGET5) $(TARGET5).c

$(TARGET6): $(TARGET6).c
	$(CC) -static $(CFLAGS) -o $(TARGET6) $(TARGET6).c

$(TARGET7): $(TARGET7).c
	$(CC) -static $(CFLAGS) -o $(TARGET7) $(TARGET7).c

$(TARGET8): $(TARGET8).c
	$(CC) $(CFLAGS) -o $(TARGET8) $(TARGET8).c

$(TARGET9): $(TARGET9).c
	$(CC) -static $(CFLAGS) -o $(TARGET9) $(TARGET9).c -lpthread

$(TARGET10): $(TARGET10).c
	$(CC)  $(CFLAGS) -o $(TARGET10) $(TARGET10).c -lpthread

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin;

	cp $(TARGET1) $(DESTDIR)$(PREFIX)/bin/$(TARGET1)
	cp $(TARGET2) $(DESTDIR)$(PREFIX)/bin/$(TARGET2)
	cp $(TARGET3) $(DESTDIR)$(PREFIX)/bin/$(TARGET3)
	cp $(TARGET4) $(DESTDIR)$(PREFIX)/bin/$(TARGET4)
	cp $(TARGET5) $(DESTDIR)$(PREFIX)/bin/$(TARGET5)
	cp $(TARGET6) $(DESTDIR)$(PREFIX)/bin/$(TARGET6)
	cp $(TARGET7) $(DESTDIR)$(PREFIX)/bin/$(TARGET7)
	cp $(TARGET8) $(DESTDIR)$(PREFIX)/bin/$(TARGET8)
	cp $(TARGET9) $(DESTDIR)$(PREFIX)/bin/$(TARGET9)
	cp $(TARGET10) $(DESTDIR)$(PREFIX)/bin/$(TARGET10)

clean:
	rm -f $(TARGET1) $(TARGET2) $(TARGET3) $(TARGET4) $(TARGET5) $(TARGET6) $(TARGET7) $(TARGET8) $(TARGET9) $(TARGET10) *.o
