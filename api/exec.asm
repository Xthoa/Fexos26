bits 32
section .text
global _exec
_exec:
	push ecx
	push edx
	mov eax,24
	mov ecx,[esp+12]
	mov edx,[esp+16]
	int 0x31
	pop edx
	pop ecx
	ret
global _wait
_wait:
	push edx
	mov eax,25
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret