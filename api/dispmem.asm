bits 32
section .text
global _dispmem
_dispmem:
	mov eax,21
	int 0x31
	ret
