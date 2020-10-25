bits 32
section .text
global _putstr
_putstr:
	push esi
	mov eax,13
	mov esi,[esp+8]
	int 0x31
	pop esi
	ret
global _puts
_puts:
	push esi
	mov eax,14
	mov esi,[esp+8]
	int 0x31
	pop esi
	ret