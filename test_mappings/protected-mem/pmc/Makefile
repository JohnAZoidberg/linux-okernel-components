.PHONY: clean

all: protected_memory_client

protected_memory_client:
	$(CC) $(CFLAGS) -o protected_memory_client protected_memory_client.c

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin;
	cp protected_memory_client $(DESTDIR)$(PREFIX)/bin/protected_memory_client

clean:
	rm -rf *.o *~ core protected_memory_client
