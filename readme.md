# Fexos (26) 2.0 
Builder: Xthoa  
Compile Time: 2020-10-07 16:45  
Github: https://github.com/Xthoa/Fexos26

Brief:
This is a small opensrc os.
It is totally handwritten line by line.  
It contains:  
- A core with C and assembly
- Memory managment
- File system (readonly)
- Keyboard decoder
- Multitask and process communication
- User app executer [normally end with .fex]
- Shell with some commands
- Lots of API functions (up to 52 funcs in v1.9)
- GUI (Console only) and a pack of ASCII fonts

The shell has 4 internal commands now:  
- help		Display help message
- info		Display os information
- ver		Display version info
- exit		Exit from shell

In update v2.0, the screen output changed to graphic mode. 
The output is still a stream but every char is represented 
by a 8*16 bitmap. The font is in 'system.font' in the fs.
The bitmap can be edit graphically in system.font.txt.

Packed .fex executable:
- cls.fex
- mem.fex
- echo.fex
- shell.fex
- test.fex

Compilor dependency:  
Most is from GCC 4.9.2 32bit tools within my devc++  
- gcc
- ld
- ar
- objcopy
- nasm

Other handwritten tools are in /tools folder:
- fexfs2
- imager
- mkexe

