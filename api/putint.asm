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
global _putintd
_putintd:
	push ecx
	push edx
	mov eax,4
	mov ecx,[esp+12]
	mov edx,[esp+16]
	int 0x31
	pop ecx
	pop edx
	ret
global _putdecd
_putdecd:
	push ecx
	push edx
	mov eax,5
	mov ecx,[esp+12]
	mov edx,[esp+16]
	int 0x31
	pop ecx
	pop edx
	ret