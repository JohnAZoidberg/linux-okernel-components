ifeq ($(KERNELRELEASE),)

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

.PHONY: build clean

build:
	$(MAKE)  -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c  *.symvers *.order

install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) \
		INSTALL_MOD_PATH=$(INSTALL_ROOT) modules_install
else

$(info Building with KERNELRELEASE = ${KERNELRELEASE})
obj-m :=    kernel_vuln.o

endif
