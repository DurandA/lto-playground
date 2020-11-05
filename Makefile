TARGET_PREFIX=riscv64-unknown-elf-
CPUFLAGS=-march=rv32i -mabi=ilp32

CC=$(TARGET_PREFIX)gcc

COMMONFLAGS = $(DEPFLAGS) -O3 $(CPUFLAGS) -g3 -fomit-frame-pointer -flto -fuse-linker-plugin -Wall -fno-builtin -nostdinc -fno-stack-protector -I.
CFLAGS = $(COMMONFLAGS) -fexceptions -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes
LDFLAGS = -nostdlib -nodefaultlibs -O3 $(CPUFLAGS)

firmware.elf: main.o memset.o
	$(CC) $(LDFLAGS) -o $@ main.o memset.o

# memset.o: memset.c
# 	$(CC) -c -o $@ $< $(CFLAGS) -fno-lto

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm *o firmware.elf firmware.bin
