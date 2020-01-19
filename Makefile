SRC_PATH := /home/pranith/local/qemu
BUILD_DIR := $(SRC_PATH)/build

include $(BUILD_DIR)/config-host.mak
include $(SRC_PATH)/rules.mak

$(call set-vpath, $(SRC_PATH)/tests/plugin)

NAMES := qsim

SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))

QEMU_CFLAGS += -fPIC
QEMU_CFLAGS += -I$(SRC_PATH)/include/qemu

all: $(SONAMES)

lib%.so: %.o
	$(CC) -shared -Wl,-soname,$@ -o $@ $^ $(LDLIBS)

clean:
	rm -f *.o *.so *.d
	rm -Rf .libs

.PHONY: all clean
