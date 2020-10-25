bits 32
section .text
global _read
_read:
	push edi
	push ecx
	mov eax,53
	mov edx,[esp+12]
	mov edi,[esp+16]
	mov ecx,[esp+20]
	int 0x31
	pop edi
	pop ecx
	ret
global _write
_write:
	push esi
	push ecx
	mov eax,54
	mov edx,[esp+12]
	mov esi,[esp+16]
	mov ecx,[esp+20]
	int 0x31
	pop esi
	pop ecx
	ret