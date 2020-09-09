default: fexos.lib string.lib std.lib

src = putchar.o puts.o putint.o getch.o cls.o startup.o dispmem.o

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
	rm *.o *.obj