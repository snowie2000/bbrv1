obj-m := tcp_bbrplus.o

PWD:=$(shell pwd)
KVER:=$(shell uname -r)
KDIR:=/lib/modules/$(KVER)/build
MODULE_NAME := tcp_bbrplus.ko
TARGET_DIR := /lib/modules/$(KVER)/kernel/net/ipv4


EXTRA_CFLAGS += -Wall -g

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	
# The default target is 'install'
install:
	# Ensure target directory exists
	mkdir -p $(TARGET_DIR)

	# Copy the module to the target directory
	cp $(MODULE_NAME) $(TARGET_DIR)

	# Update module dependencies
	depmod

	# Load the module using insmod
	insmod $(TARGET_DIR)/$(MODULE_NAME)

	@echo "Module $(MODULE_NAME) installed and loaded successfully."

# Optionally, you can include a 'clean' target to remove the copied file
clean:
	sudo rm -f $(TARGET_DIR)/$(MODULE_NAME)
	@echo "Module $(MODULE_NAME) removed from $(TARGET_DIR)."

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean