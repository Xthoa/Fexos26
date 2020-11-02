boot = boot\boot.bin boot\loader.bin
kernel = kernel\start.bin
app = app\shell.fex app\test.fex \
	app\mem.fex app\cls.fex app\echo.fex \
	app\run.fex app\cpptest.fex app\color.fex \
	app\dir.fex
need = rule.txt fsrule.txt fsrule.system.txt fsrule.user.txt \
	kernel\system.font.txt

default:
	make img

install:
	run.exe "fexos.img 180"

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
	fexfs2 fsrule.txt fs.bin 73728 4 73728
	imager rule.txt fexos.img

clean:
	rm fs.bin tmp.bin
	make -C boot clean
	make -C kernel clean
	make -C api clean
	make -C app clean