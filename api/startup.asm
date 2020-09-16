bits 32
section .entry
extern _start
global _entry
_entry:
push dword [esp+4]
mov [0],ebx
call _start
add esp,4
retf