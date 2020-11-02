bits 32
section .text
global _wait_hlt
_wait_hlt:
	push edx
	mov eax,26
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret
global _wait_send
_wait_send:
	push edx
	mov eax,27
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret
global _wait_send_hlt
_wait_send_hlt:
	push edx
	mov eax,28
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret