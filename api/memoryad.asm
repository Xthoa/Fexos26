bits 32
section .text
global _malloc_raw
_malloc_raw:
	mov eax,22
	mov edx,[esp+4]
	int 0x31
	ret
global _push_page
_push_page:
	push ecx
	mov eax,23
	mov edx,[esp+8]
	mov ecx,[esp+12]
	int 0x31
	pop ecx
	ret
global _push_malloc_page
_push_malloc_page:
	mov eax,38
	mov edx,[esp+4]
	int 0x31
	ret