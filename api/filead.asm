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