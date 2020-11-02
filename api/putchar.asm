bits 32
section .text
global _putchar
_putchar:
	push ecx
	mov eax,1
	mov ecx,[esp+8]
	int 0x31
	pop ecx
	ret