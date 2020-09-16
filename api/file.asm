;file file.asm
bits 32
section .text
global _findfile
_findfile:
	mov eax,32
	mov esi,[esp+4]
	int 0x31
	ret
global _filepos
_filepos:
	mov eax,33
	mov edx,[esp+4]
	int 0x31
	ret
global _fopen
_fopen:
	sub esp,8
	mov eax,dword [esp+12]
	mov [esp],eax
	call _findfile
	mov [esp],eax
	call _filepos
	add esp,8
	ret