bits 32
section .text$putchar
global _putchar
_putchar:
	mov eax,1
	mov ecx,[esp+4]
	int 0x31
	ret
section .text$putint
global _putint
_putint:
	mov eax,2
	mov ecx,[esp+4]
	int 0x31
	ret
section .text$putdec
global _putdec
_putdec:
	mov eax,3
	mov ecx,[esp+4]
	int 0x31
	ret
section .text$putintd
global _putintd
_putintd:
	mov eax,4
	mov ecx,[esp+4]
	mov edx,[esp+8]
	int 0x31
	ret
global _putdecd
_putdecd:
	mov eax,5
	mov ecx,[esp+4]
	mov edx,[esp+8]
	int 0x31
	ret
global _putcr
_putcr:
	mov eax,6
	int 0x31
	ret
global _putlf
_putlf:
	mov eax,7
	int 0x31
	ret
global _hello_world
_hello_world:
	mov eax,8
	int 0x31
	ret
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
	mov eax,11
	mov ecx,[esp+4]
	int 0x31
	ret
global _putback
_putback:
	mov eax,12
	mov ecx,[esp+4]
	int 0x31
	ret
global _putstr
_putstr:
	mov eax,13
	mov esi,[esp+4]
	int 0x31
	ret
global _puts
_puts:
	mov eax,14
	mov esi,[esp+4]
	int 0x31
	ret