bits 32
section .text
global _putint
_putint:
	push ecx
	mov eax,2
	mov ecx,[esp+8]
	int 0x31
	pop ecx
	ret
global _putdec
_putdec:
	push ecx
	mov eax,3
	mov ecx,[esp+8]
	int 0x31
	pop ecx
	ret