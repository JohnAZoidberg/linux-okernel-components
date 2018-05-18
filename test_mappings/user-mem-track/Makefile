default: uxt

uxt.o: uxt.c
	gcc -c uxt.c -o uxt.o

uxt: uxt.o
	gcc uxt.o -o uxt

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin;
	cp uxt $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f uxt.o
	rm -f uxt

