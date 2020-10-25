bits 32
section .text
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