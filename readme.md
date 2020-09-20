# Fexos (26) 1.7 
Builder: Xthoa  
Compile Time: 2020-09-20 14:30  
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
- Lots of API functions (up to 40 funcs in v1.7)

The keyboard input supports extend keys like 
ins, del, pgdn etc. but the shell does not 
change input statuc an is always in insert mode. 
The key will be send to the program so some 
user app can make response to these keys.

The shell has 4 internal commands now:  
- help		Display help message
- info		Display os information
- ver		Display version info
- exit		Exit from shell

In update v1.7, inputing filename excluding '.fex' can also
be recognized. .fex file format added a magic number
0x78656600 ('\0fex') in the front of the file. If the 
magic number is incorrect, the startup will terminate.

Packed .fex executable:
- cls.fex
- mem.fex
- echo.fex

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

