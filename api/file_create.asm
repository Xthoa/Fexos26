bits 32
section .text
global _create
_create:
	push esi
	push ecx
	push edx
	mov eax,68
	mov esi,[esp+16]
	mov ecx,[esp+20]
	mov edx,[esp+24]
	int 0x31
	pop edx
	pop ecx
	pop esi
	ret