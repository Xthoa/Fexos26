bits 32
section .text
global _oflush
_oflush:
	mov eax,69
	int 0x31
	ret