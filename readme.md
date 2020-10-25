# Fexos (26) 2.2 
Builder: Xthoa  
Compile Time: 2020-10-25 21:00  
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
- Lots of API functions (up to 69 funcs in v2.2)
- GUI (Console only) and a pack of ASCII fonts

The shell has 6 internal commands now:  
- help		Display help message
- info		Display os information
- ver		Display version info
- exit		Exit from shell
- cd		Change directory
- pwd		Print working directory

In update v2.2:
1. The fs is no longer read only and now uses tree structure 
to organize files. '/' seperating dirs in file paths can be 
recognized in the functions. exec() makes the child process 
inherit its father's working directory [so that dir.fex could work.]
2. More API functions are added, such as file operation. 
3. API oflush() puts char(0x03) into the stream to flush it. 
When output routine found this flag, it resets the cursor 
position so that '\b' may not work right after this.
4. Fixed 2 bugs in file operation.

Packed .fex executable:
- cls.fex
- mem.fex
- echo.fex
- shell.fex
- test.fex
- dir.fex
- cpptest.fex
- run.fex (failed)

Compilor dependency:  
Most is from GCC 4.9.2 32bit tools within my devc++  
- gcc
- ld [my ld was 64bit so i copied a 32bit-ld and renamed it as gld]
- ar
- objcopy
- nasm

Other handwritten tools are in /tools folder:
- fexfs2
- imager
- mkexe
- makefont

