.PHONY: clean

all: kernel_vuln_client


kernel_vuln_client:
	$(CC) $(CFLAGS) -o kernel_vuln_client kernel_vuln_client.c

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin;
	cp kernel_vuln_client $(DESTDIR)$(PREFIX)/bin/kernel_vuln_client

clean:
	rm -rf *.o *~ core kernel_vuln_client
