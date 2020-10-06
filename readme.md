# Fexos (26) 1.9 
Builder: Xthoa  
Compile Time: 2020-10-06 21:30  
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

In update v1.9, the 'cache' structure has another name 'file'
and can be used to describe a dynamic file. 'file' structure
used to describe file in filesystem changes its name to 'staticfile'.
Opening a file adds an 'accessed' bit to its flag whatever the
open mode is. After that, any other open() will fail and return 
NULL. Closing the file clears the bit and it allows open() to open it again.

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

The next version is planned to be v2.0. 
It planned to have the following features:
- GUI
- File system query and operation
According to the plan, these features are going to be added in a few versions:
- Mouse
- Drivers
- Settings
- 32bit disk operation
- Network system
- ......whatever! I don't think i have enough time and knowledge for them...
