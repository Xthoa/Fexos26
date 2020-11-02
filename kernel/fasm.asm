;asm funcs
global _int21_asm,_hlt,_out8,_int20_asm,_restart
global _int0e_asm,_int0d_asm,_cpuid,_memset,_read_cr3
global _read_eflags,_delay,_farcall,_destart,_app_startup_asm
global _cr3_kernel,_cr3_user,_int0b_asm,_int0c_asm
global _int00_asm
extern _int21,_int3,_int0e,_int0d,_int20,_putch
extern _int0b,_int0c,_int00
irqback:
	mov al,0x20
	out 0x20,al
	ret
_int21_asm:
	pushad
	xor eax,eax
	in al,0x60
	push eax
	call _int21
	call irqback
	add esp,4
	popad
	iretd
_hlt:
	hlt
	ret
_out8:
	mov eax,[esp+8]
	mov edx,[esp+4]
	out dx,al
	ret
_int0e_asm:
	pushad
	push ds
	push es
	
	mov ebx,[esp+48]
	mov ecx,[esp+44]
	mov edx,[esp+40]
	
	mov ax,ds
	mov esi,1
	cmp ax,8
	je .call
	
	mov ax,8
	mov ds,ax
	mov es,ax
	
	mov ss,ax
	add esp,0x00400000
	mov esi,0
.call:
	push esi
	push ebx
	push ecx
	push edx
	mov eax,cr2
	push eax
	call _int0d
	add esp,16
	
	pop eax
	cmp eax,1
	je .ret
	
	sub esp,0x00400000
	mov ss,[4096+12]
	mov ebp,[4096+44]
	
	pop es
	pop ds
	
	mov [esp+8],ebp
	popad
	
	mov esp,ebp
	
	retf
.ret:
	pop es
	pop ds
	
	popad
	iretd
_int0d_asm:
	pushad
	push ds
	push es
	
	mov ebx,[esp+48]
	mov ecx,[esp+44]
	mov edx,[esp+40]
	
	mov ax,ds
	mov esi,1
	cmp ax,8
	je .call
	
	mov ax,8
	mov ds,ax
	mov es,ax
	
	mov ss,ax
	add esp,0x00400000
	mov esi,0
.call:
	push esi
	push ebx
	push ecx
	push edx
	call _int0d
	add esp,12
	
	pop eax
	cmp eax,1
	je .ret
	
	sub esp,0x00400000
	mov ss,[4096+12]
	mov ebp,[4096+44]
	pop es
	pop ds
	
	mov [esp+8],ebp
	popad
	
	mov esp,ebp
	
	retf
.ret:
	pop es
	pop ds
	
	popad
	iretd
_int0b_asm:
	pushad
	push ds
	push es
	
	mov ax,8
	mov ds,ax
	mov es,ax
	
	mov ebx,[esp+48]
	mov ecx,[esp+44]
	mov edx,[esp+40]
	
	mov ss,ax
	add esp,0x00400000
	
	push ebx
	push ecx
	push edx
	call _int0b
	add esp,12
	
	sub esp,0x00400000
	mov ss,[4096+12]
	mov ebp,[4096+44]
	
	pop es
	pop ds
	
	mov [esp+8],ebp
	popad
	
	mov esp,ebp
	
	retf
_int0c_asm:
	pushad
	push ds
	push es
	
	mov ax,8
	mov ds,ax
	mov es,ax
	
	mov ebx,[esp+48]
	mov ecx,[esp+44]
	mov edx,[esp+40]
	
	mov ss,ax
	add esp,0x00400000
	
	push ss
	push esp
	push ebx
	push ecx
	push edx
	call _int0c
	add esp,18
	
	sub esp,0x00400000
	mov ss,[4096+12]
	mov ebp,[4096+44]
	
	pop es
	pop ds
	
	mov [esp+8],ebp
	popad
	
	mov esp,ebp
	
	retf
_int00_asm:
	pushad
	push ds
	push es
	mov ax,8
	mov ds,ax
	mov es,ax
	mov ecx,[esp+44]
	mov edx,[esp+40]
	mov ss,ax
	add esp,0x00400000
	push ecx
	push edx
	call _int00
	add esp,8
	sub esp,0x00400000
	mov ss,[4096+12]
	mov ebp,[4096+44]
	pop es
	pop ds
	mov [esp+8],ebp
	popad
	mov esp,ebp
	retf
_cpuid:
	push edi
	push ebx
	push ecx
	push edx
	mov eax,[esp+20]
	cpuid
	mov edi,[esp+24]
	mov [edi],eax
	mov [edi+4],ebx
	mov [edi+8],ecx
	mov [edi+12],edx
	pop edx
	pop ecx
	pop ebx
	pop edi
	ret
_int20_asm:
	pushad
	call irqback
	call _int20
	popad
	iretd
_restart:		;0
	sub esp,12	;-12
	pushad	;8	;-44
	mov ebx,[esp+48]	;esp+32+12+4
	push gs	;48
	push fs	;52
	push es	;56
	push ds	;5	;60
	pushfd
	pop eax
	mov [esp+56],eax
	mov ax,cs
	mov [esp+52],ax
	mov dword [esp+48],.ret;
	mov ax,8
	mov ds,ax
	mov eax,cr3
	mov [ebx+8],eax
	mov [ebx+4],ss
	mov [ebx],esp
	add esp,60		;esp+4+20+32+12
	mov ebx,[esp+8]
	mov esp,[ebx]
	mov ss,[ebx+4]
	mov eax,[ebx+8]
	mov cr3,eax
	pop ds
	pop es
	pop fs
	pop gs
	popad
	iretd
	.ret:
	ret
_memset:
	push edi
	push ecx
	mov edi,[esp+12]
	mov eax,[esp+16]
	mov ecx,[esp+20]
	rep stosb
	pop ecx
	pop edi
	ret
_read_cr3:
	mov eax,cr3
	ret
_read_eflags:
	pushfd
	pop eax
	ret
_delay:
	push ecx
	mov ecx,[esp+8]
	shl ecx,19
	.loop:
	loop .loop
	pop ecx
	ret
_farcall:
	call far [esp+4]
	ret
_app_startup_asm:
	pushad
	
	mov ebx,[esp+36]	;&app
	mov edi,[esp+40]	;argc
	
	mov [ebx+16],esp
	mov [ebx+20],ss
	mov esp,[ebx+8]
	mov ss,[ebx+12]
	
	mov edx,[ebx]
	mov ecx,[ebx+4]
	
	mov eax,ss
	mov esi,eax
	mov es,ax
	mov fs,ax
	mov gs,ax
	
	mov eax,esp
	sub eax,24
	mov [ebx+44],eax
	
	mov eax,[ebx+32]
	mov cr3,eax
	
	mov eax,esi
	mov ds,ax
	
	push ecx
	push edx
	push ebx
	push edi
	call far [esp+8]
	add esp,4
	pop ebx
	add esp,8
	
	mov eax,8
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
	
	mov eax,0x8000
	mov cr3,eax
	
	mov esp,[ebx+16]
	mov ss,[ebx+20]
	
	popad
	ret
_destart:
	mov ax,8
	mov ds,ax
	mov ebx,[esp+4]
	mov esp,[ebx]
	mov ss,[ebx+4]
	mov eax,[ebx+8]
	mov cr3,eax
	pop ds
	pop es
	pop fs
	pop gs
	popad
	iretd
	.ret:
	ret
_cr3_kernel:
	mov eax,0x8000
	mov cr3,eax
	ret
_cr3_user:
	mov eax,[esp+4]
	mov cr3,eax
	ret