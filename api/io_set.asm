bits 32
section .text
global _oflush
_oflush:
	mov eax,69
	int 0x31
	ret
global _get_color
_get_color:
	mov eax,70
	int 0x31
	ret
global _set_color
_set_color:
	push edx
	mov eax,71
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret
