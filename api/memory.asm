bits 32
section .text
global _malloc_page
_malloc_page:
	push ecx
	mov eax,42
	mov ecx,[esp+8]
	int 0x31
	pop ecx
	ret
global _free_page
_free_page:
	push ecx
	push edx
	mov eax,43
	mov edx,[esp+12]
	mov ecx,[esp+16]
	int 0x31
	pop ecx
	pop edx
	ret