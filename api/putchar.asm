bits 32
section .text
global _putchar
_putchar:
	mov eax,1
	mov ecx,[esp+4]
	int 0x31
	ret