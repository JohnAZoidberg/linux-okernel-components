default: bypass

bypass.o: bypass.c
	gcc -c bypass.c -o bypass.o

bypass: bypass.o
	gcc bypass.o -o bypass

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin;
	cp bypass params.sh $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f bypass.o
	rm -f bypass
