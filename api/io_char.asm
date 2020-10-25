bits 32
section .text
global _putc
_putc:
	push ecx
	push edx
	mov eax,45
	mov ecx,[esp+16]
	mov edx,[esp+12]
	int 0x31
	pop edx
	pop ecx
	ret
global _getc
_getc:
	push edx
	mov eax,46
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret