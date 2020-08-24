src = boot\boot.bin boot\loader.bin kernel\start.bin
need = rule.txt

default: fexos.img

debug: fexos.img makefile
	bochsdbg -log vmlog.txt -f bochsrc.txt

run: fexos.img makefile
	bochs -log vmlog.txt -f bochsrc.txt

qemu: fexos.img makefile
	qemu.bat

img:
	make fexos.img

fexos.img: $(src) $(need) makefile
	make -C boot
	make -C kernel
	imager rule.txt fexos.img
