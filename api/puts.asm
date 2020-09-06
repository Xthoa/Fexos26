bits 32
section .text
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