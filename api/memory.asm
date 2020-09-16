bits 32
section .text
global _malloc
_malloc:
	mov eax,22
	mov edx,[esp+4]
	int 0x31
	ret
global _push_page
_push_page:
	mov eax,23
	mov ebx,[esp+4]
	mov ecx,[esp+8]
	int 0x31
	ret