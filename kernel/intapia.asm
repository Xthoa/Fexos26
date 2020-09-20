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
extern _delay
_int31_asm:
	;push 16
	;call _delay
	;add esp,4
	push ebx
	mov ebx,[8]
	push ds
	push es
	push eax
	mov ax,8
	mov ds,ax
	mov es,ax
	pop eax
	mov [ebx+8],esp
	mov [ebx+12],ss
	mov esp,[ebx+16]
	mov ss,[ebx+20]
	push ebx
	pushad
	sub esp,0x20
	pushad
	push 0x31
	call _apideliv
	add esp,36
	add esp,0x20
	mov [esp+28],eax
	popad
	pop ebx
	mov [ebx+16],esp
	mov [ebx+20],ss
	mov esp,[ebx+8]
	mov ss,[ebx+12]
	pop es
	pop ds
	pop ebx
	iretd