boot = boot\boot.bin boot\loader.bin
kernel = kernel\start.bin
app = app\shell.fex app\test.fex
need = rule.txt fsrule.txt

default:
	make img

debug: 
	make img
	bochsdbg -f bochsrc.bxrc

run: 
	make img
	bochs -f bochsrc.bxrc

qemu:
	make img
	qemu.bat

img:
	make -C boot
	make -C kernel
	make -C api
	make -C app
	make fexos.img

fexos.img: $(boot) $(kernel) $(app) $(need) makefile
	fexfs2 fsrule.txt fs.bin
	imager rule.txt fexos.img

clean:
	make -C boot clean
	make -C kernel clean
	make -C api clean
	make -C app clean