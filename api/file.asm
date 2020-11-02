;file file.asm
bits 32
section .text
global _open
_open:
	push esi
	push edx
	mov eax,44
	mov esi,[esp+12]
	mov edx,[esp+16]
	int 0x31
	pop edx
	pop esi
	ret
global _close
_close:
	push edx
	mov eax,49
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret