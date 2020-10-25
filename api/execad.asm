bits 32
section .text
global _wait_hlt
_wait_hlt:
	mov eax,26
	mov edx,[esp+4]
	int 0x31
	ret
global _wait_send
_wait_send:
	mov eax,27
	mov edx,[esp+4]
	int 0x31
	ret
global _wait_send_hlt
_wait_send_hlt:
	mov eax,28
	mov edx,[esp+4]
	int 0x31
	ret