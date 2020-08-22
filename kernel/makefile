default: start.bin

start.o: start.c makefile
	gcc -c start.c -o start.o -m32 -O2

fasm.o: fasm.asm makefile
	nasm fasm.asm -o fasm.o -f elf32

start.b: start.o fasm.o c.lds makefile
	gld -T c.lds -b pei-i386 start.o fasm.o -o start.b

start.bin: start.b makefile
	objcopy -O binary -j .text -j .rdata start.b start.bin

clean:
	del start.gas start.nas start.asm
