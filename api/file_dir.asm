bits 32
section .text
global _chdir
_chdir:
	push esi
	mov eax,61
	mov esi,[esp+8]
	int 0x31
	pop esi
	ret
global _get_pwd
_get_pwd:
	mov eax,62
	int 0x31
	ret
global _dir_to_file
_dir_to_file:
	push esi
	mov eax,64
	mov esi,[esp+8]
	int 0x31
	pop esi
	ret
global _rbdir
_rbdir:
	mov eax,59
	int 0x31
	ret