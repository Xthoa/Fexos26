bits 32
section .entry
extern _start
global _entry
_entry:
push 4
push dword [esp+12]
call _start
add esp,8
retf