bits 32
section .text
global _putcr
_putcr:
	mov eax,6
	int 0x31
	ret
global _putlf
_putlf:
	mov eax,7
	int 0x31
	ret