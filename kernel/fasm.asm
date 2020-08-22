;asm funcs
global _int21_asm,_hlt,_out8
extern _int21
_int21_asm:
	xor eax,eax
	in al,0x60
	push eax
	call _int21
	add esp,4
	mov al,0x20
	out 0x20,al
	iretd
_hlt:
	hlt
	ret
_out8:
	mov eax,[esp+8]
	mov edx,[esp+4]
	out dx,al