default: boot.bin loader.bin

cd: cdboot.asm
	nasm cdboot.asm -o cdboot.bin -f bin

boot.bin: boot.asm rmio.inc makefile
	nasm boot.asm -o boot.bin -f bin

loader.bin: loader.asm desc.inc pmio.inc makefile
	nasm loader.asm -o loader.bin -f bin

clean:
	rm boot.bin loader.bin