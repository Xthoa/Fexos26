;file file.asm
bits 32
section .text
global _open
_open:
	push esi
	mov eax,44
	mov esi,[esp+8]
	mov edx,[esp+12]
	int 0x31
	pop esi
	ret
global _close
_close:
	mov eax,49
	mov edx,[esp+4]
	int 0x31
	ret