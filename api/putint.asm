bits 32
section .text
global _putint
_putint:
	mov eax,2
	mov ecx,[esp+4]
	int 0x31
	ret
global _putdec
_putdec:
	mov eax,3
	mov ecx,[esp+4]
	int 0x31
	ret
global _putintd
_putintd:
	mov eax,4
	mov ecx,[esp+4]
	mov edx,[esp+8]
	int 0x31
	ret
global _putdecd
_putdecd:
	mov eax,5
	mov ecx,[esp+4]
	mov edx,[esp+8]
	int 0x31
	ret