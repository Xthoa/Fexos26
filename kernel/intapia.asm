;intapia.asm
global _int30_asm,_int31_asm
extern _apideliv

_int30_asm:
	push ds
	push es
	pushad
	push eax
	mov ax,8
	mov ds,ax
	mov es,ax
	pop eax
	pushad
	push 0x30
	call _apideliv
	add esp,36
	popad
	pop es
	pop ds
	iretd
extern _delay
_int31_asm:
	;push 16
	;call _delay
	;add esp,4
	push ebx
	mov ebx,[8]
	push ds
	push es
	push eax
	mov ax,8
	mov ds,ax
	mov es,ax
	pop eax
	mov [ebx+8],esp
	mov [ebx+12],ss
	mov esp,[ebx+16]
	mov ss,[ebx+20]
	push ebx
	pushad
	sub esp,0x20
	pushad
	push 0x31
	call _apideliv
	add esp,36
	add esp,0x20
	mov [esp+28],eax
	popad
	pop ebx
	mov [ebx+16],esp
	mov [ebx+20],ss
	mov esp,[ebx+8]
	mov ss,[ebx+12]
	pop es
	pop ds
	pop ebx
	iretd

extern _interrdeliv
global _interr00
global _interr01
global _interr03
global _interr04
global _interr05
global _interr06
global _interr07
global _interr08
global _interr0a
global _interr0b
global _interr0c
global _interr10
global _interr11
global _interr12
global _interr13
_interr00:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x00
	call _interrdeliv
	add esp,8
	iretd
_interr01:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x01
	call _interrdeliv
	add esp,8
	iretd
_interr03:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x03
	call _interrdeliv
	add esp,8
	iretd
_interr04:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x04
	call _interrdeliv
	add esp,8
	iretd
_interr05:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x05
	call _interrdeliv
	add esp,8
	iretd
_interr06:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x06
	call _interrdeliv
	add esp,8
	iretd
_interr07:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x07
	call _interrdeliv
	add esp,8
	iretd
_interr08:
	mov eax,8
	mov ds,ax
	mov es,ax
	mov edi,0xb8000
	mov eax,0x1f00
	mov ecx,80*25
	rep stosw
	mov edi,0xb87c2
	mov esi,abort
	mov ecx,14
	.loop:
	movsb
	inc edi
	loop .loop
	hlt
	iretd
abort:
	db "INT 0x08 ABORT"
_interr0a:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x0a
	call _interrdeliv
	add esp,8
	iretd
_interr0b:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x0b
	call _interrdeliv
	add esp,8
	iretd
_interr0c:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x0c
	call _interrdeliv
	add esp,8
	iretd
_interr10:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x10
	call _interrdeliv
	add esp,8
	iretd
_interr11:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x11
	call _interrdeliv
	add esp,8
	iretd
_interr12:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x12
	call _interrdeliv
	add esp,8
	iretd
_interr13:
	mov eax,8
	mov ds,ax
	mov ss,ax
	push 0x00
	push 0x13
	call _interrdeliv
	add esp,8
	iretd