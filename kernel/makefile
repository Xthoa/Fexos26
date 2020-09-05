objs = start.o memory.o task.o io.o cache.o intapi.o file.o desc.o fasm.obj intapia.obj

default: start.bin test.fex

%.o: %.c makefile kernel.h
	gcc -c -m32 -O2 -std=c11 $*.c -o $*.o

%.obj: %.asm makefile
	nasm $*.asm -o $*.obj -f elf32

start.b: $(objs) c.lds makefile
	gld -T c.lds $(objs) -o start.b

start.bin: start.b makefile
	objcopy -O binary -j .text -j .rdata start.b start.bin

test.fex: t2.o fexos.h fexos.lib startup.lib t2.lds makefile
	gld -T t2.lds t2.o fexos.lib -o test.b -e _entry
	objcopy -O binary -j .text -j .rdata test.b test.bin
	mkexe -i test.bin -o test.fex -d 16 -b 0 -e 0

fexos.lib: fexos.asm startup.asm fexos.h makefile
	nasm fexos.asm -o fexos.o -f win
	nasm startup.asm -o startup.o -f win
	ar -rc fexos.lib fexos.o startup.o

clean:
	del *.o start.b