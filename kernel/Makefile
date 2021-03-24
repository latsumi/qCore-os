SRCS = $(wildcard *.S *.c)
OBJS = $(addsuffix .o, $(basename $(SRCS)))

# Try to infer the correct TOOLPREFIX if not set
TOOLPREFIX = riscv64-unknown-elf-
CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump
GDB = $(TOOLPREFIX)gdb

CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I.
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
# ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
# CFLAGS += -fno-pie -no-pie
# endif
# ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
# CFLAGS += -fno-pie -nopie
# endif

LDFLAGS = -z max-page-size=4096

kernel: $(OBJS) kernel.ld
	$(LD) $(LDFLAGS) -T kernel.ld -o kernel $(OBJS)

clean: 
	rm -f *.o *.d kernel

ifndef CPUS
CPUS := 1
endif

# BOARD
BOARD		?= qemu
SBI			?= rustsbi
BOOTLOADER	:= ../tools/$(SBI)-$(BOARD).bin

QEMU = qemu-system-riscv64
QEMUOPTS = \
	-nographic \
	-smp $(CPUS) \
	-machine virt \
	-bios $(BOOTLOADER) \
	-kernel kernel

run: kernel
	$(QEMU) $(QEMUOPTS)