bits 32
section .text
global _show_dirs
_show_dirs:
	mov eax,55
	int 0x31
	ret
global _show_cur_dirs
_show_cur_dirs:
	mov eax,65
	int 0x31
	ret
global _list_dirs
_list_dirs:
	push edx
	mov eax,63
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret