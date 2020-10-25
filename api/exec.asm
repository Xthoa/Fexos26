bits 32
section .text
global _exec
_exec:
	mov eax,24
	mov ecx,[esp+4]
	mov edx,[esp+8]
	int 0x31
	ret
global _wait
_wait:
	mov eax,25
	mov edx,[esp+4]
	int 0x31
	ret