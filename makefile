src = boot\boot.bin boot\loader.bin kernel\start.bin
need = rule.txt

default:
	make img

debug:
	make img
	bochsdbg -log vmlog.txt -f bochsrc.txt

run:
	make img
	bochs -log vmlog.txt -f bochsrc.txt

img:
	make -C boot
	make -C kernel
	make fexos.img

fexos.img: $(src) $(need) makefile
	imager rule.txt fexos.img
