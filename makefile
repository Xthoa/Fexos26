src = boot\boot.bin boot\loader.bin kernel\start.bin kernel\test.bin
need = rule.txt fsrule.txt

default:
	make img

debug: 
	make img
	bochsdbg -log vmlog.txt -f bochsrc.txt

run: 
	make img
	bochs -log vmlog.txt -f bochsrc.txt

qemu:
	make img
	qemu.bat

img:
	make -C boot
	make -C kernel
	make fexos.img

fexos.img: $(src) $(need) makefile
	fexfs2 fsrule.txt fs.bin
	imager rule.txt fexos.img
