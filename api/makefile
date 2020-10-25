default: fexos.lib string.lib std.lib

src = startup.o \
		putchar.o puts.o putline.o \
		putint.o putintd.o cls.o \
		getch.o \
		dispmem.o memory.o memoryad.o \
		exec.o execad.o mtad.o \
		file.o file_create.o \
		filead.o file_dir.o file_diro.o \
		io_char.o io_str.o io_set.o
		

%.o: %.asm makefile
	nasm $*.asm -o $*.o -f win

%.obj: %.c makefile
	gcc -c -m32 -o $*.obj $*.c -std=c11 -O2

fexos.lib: $(src) makefile
	ar -rc fexos.lib $(src)

string.lib: string.obj makefile
	ar -rc string.lib string.obj

std.lib: std.obj makefile
	ar -rc std.lib std.obj

clean:
	rm *.o *.obj *.lib