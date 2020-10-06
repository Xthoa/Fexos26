;file file.asm
bits 32
section .text
global _findfile
_findfile:
	push esi
	mov eax,32
	mov esi,[esp+8]
	int 0x31
	pop esi
	ret
global _filepos
_filepos:
	mov eax,33
	mov edx,[esp+4]
	int 0x31
	ret
global _open
_open:
	push esi
	mov eax,44
	mov esi,[esp+8]
	mov edx,[esp+12]
	int 0x31
	pop esi
	ret
global _close
_close:
	mov eax,49
	mov edx,[esp+4]
	int 0x31
	ret
global _putc
_putc:
	push ecx
	mov eax,45
	mov ecx,[esp+12]
	mov edx,[esp+8]
	int 0x31
	pop ecx
	ret
global _getc
_getc:
	mov eax,46
	mov edx,[esp+4]
	int 0x31
	ret