bits 32
section .text
global _getkey
_getkey:
	mov eax,9
	int 0x31
	ret
global _getch
_getch:
	mov eax,10
	int 0x31
	ret
global _write_stdin
_write_stdin:
	push ecx
	mov eax,11
	mov ecx,[esp+8]
	int 0x31
	pop ecx
	ret
global _putback
_putback:
	push ecx
	mov eax,12
	mov ecx,[esp+8]
	int 0x31
	pop ecx
	ret