;asm funcs
global _int21_asm,_hlt,_out8
global _int3_asm,_int0e_asm,_int0d_asm
extern _int21,_int3,_int0e,_int0d
_int21_asm:
	xor eax,eax
	in al,0x60
	push eax
	call _int21
	add esp,4
	mov al,0x20
	out 0x20,al
	iretd
_int3_asm:
	sti			;so that kbd data will come
	call _int3
	iretd
_hlt:
	hlt
	ret
_out8:
	mov eax,[esp+8]
	mov edx,[esp+4]
	out dx,al
_int0e_asm:
	mov eax,cr2
	push eax
	call _int0e
	add esp,8
	iretd
_int0d_asm:
	call _int0e
	add esp,4
	iretd