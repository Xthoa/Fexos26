;intapia.asm
global _int30_asm,_int31_asm
extern _apideliv

_int30_asm:
	push ds
	push es
	pushad
	push eax
	mov ax,8
	mov ds,ax
	mov es,ax
	pop eax
	pushad
	push 0x30
	call _apideliv
	add esp,36
	popad
	pop es
	pop ds
	iretd
_int31_asm:
	push ds
	pushad
	sub esp,0x20
	push eax
	mov ax,8
	mov ds,ax
	pop eax
	pushad
	push 0x31
	call _apideliv
	add esp,36
	add esp,0x20
	mov [esp+28],eax
	popad
	pop ds
	iretd