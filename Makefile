TARGET_PREFIX=riscv64-unknown-elf-
CPUFLAGS=-march=rv32i -mabi=ilp32

CC=$(TARGET_PREFIX)gcc

COMMONFLAGS = $(DEPFLAGS) -Os $(CPUFLAGS) -g3 -fomit-frame-pointer -flto -fuse-linker-plugin -Wall -fno-builtin -nostdinc -fno-stack-protector -I.
CFLAGS = $(COMMONFLAGS) -fexceptions -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes
LDFLAGS = -nostdlib -nodefaultlibs -Os $(CPUFLAGS)

firmware.elf: main.o memset.o mulsi.o
	$(CC) $(LDFLAGS) -o $@ main.o memset.o mulsi.o

# memset.o: memset.c
# 	$(CC) -c -o $@ $< $(CFLAGS) -fno-lto

# mulsi.o: mulsi.c
# 	$(CC) -c -o $@ $< $(CFLAGS) -fno-lto

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm *o firmware.elf firmware.bin
