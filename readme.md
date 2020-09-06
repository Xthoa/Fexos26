# Fexos (26) 1.4
Builder: Xthoa  
Compile Time: 2020-09-07 17:56  
Github: https://github.com/Xthoa/Fexos26

Brief:
This is a small opensrc os.
It is totally handwritten line by line.  
Until this version, it contains:  
- A core with C
- File system [readonly]
- Keyboard decoder
- Multitask and process communication
- User app executer [normally end with .fex]
- Shell with some commands

The keyboard input does not support 'insert' status and
is always in insert mode. It doesn't support extend
keys such as del, pgdn or end; but it supports number pad.

The shell has 5 commands now:  
- help		Display help message
- info		Display os information
- ver		Display version info
- cls		Clear screen
- exit		Exit from shell

Compilation dependency:  
Most of the compilers used is from GCC 4.9.2 32bit tools
within Devc++  
- gcc
- ld
- ar
- objcopy
- nasm

Others like filesystem builder, .img maker and .fex maker
are also handwritten:  
- fexfs2
- imager
- mkexe

Great thanks for reporting bugs and ideas ~  

