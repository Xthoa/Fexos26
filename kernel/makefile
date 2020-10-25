objs = start.o memory.o task.o io.o cache.o intapi.o file.o desc.o \
		fasm.obj intapia.obj error.o

default: start.bin system.font

%.o: %.c makefile kernel.h funcs.h macro.h
	gcc -c -m32 -O1 -std=c11 -w $*.c -o $*.o

%.obj: %.asm makefile
	nasm $*.asm -o $*.obj -f elf32

start.b: $(objs) c.lds makefile
	gld -T c.lds $(objs) -o start.b

start.bin: start.b makefile
	objcopy -O binary -j .text -j .rdata start.b start.bin

system.font: system.font.txt makefile
	../makefont system.font.txt system.font

clean:
	rm *.o *.b *.obj *.bin system.font