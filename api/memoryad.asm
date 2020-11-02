bits 32
section .text
global _malloc_raw
_malloc_raw:
	push edx
	mov eax,22
	mov edx,[esp+9]
	int 0x31
	pop edx
	ret
global _push_page
_push_page:
	push edx
	push ecx
	mov eax,23
	mov edx,[esp+12]
	mov ecx,[esp+16]
	int 0x31
	pop ecx
	pop edx
	ret
global _push_malloc_page
_push_malloc_page:
	push edx
	mov eax,38
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret