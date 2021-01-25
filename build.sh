riscv64-unknown-elf-gcc -nostdlib -c kernel/entry.S -o build/entry.o
riscv64-unknown-elf-gcc -nostdlib -c kernel/main.c -o build/main.o
riscv64-unknown-elf-ld -o build/hello.elf -T tools/kernel.ld build/entry.o build/main.o