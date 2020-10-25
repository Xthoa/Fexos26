bits 32
section .text
global _malloc_page
_malloc_page:
	mov eax,42
	mov ecx,[esp+4]
	int 0x31
	ret
global _free_page
_free_page:
	mov eax,43
	mov edx,[esp+4]
	mov ecx,[esp+8]
	int 0x31
	ret