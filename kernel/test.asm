bits 32
section .text
mov eax,14
mov esi,msg
int 0x31
retf
section .data
msg:
db "abcde",0