;asm funcs
global _int21_asm,_hlt,_out8,_int20_asm,_restart
global _int0e_asm,_int0d_asm,_cpuid,_memset,_read_cr3
global _read_eflags,_delay,_farcall,_destart,_app_startup_asm
extern _int21,_int3,_int0e,_int0d,_int20
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
	mov eax,[esp+36]
	push eax
	mov eax,[esp+36]
	push eax
	mov eax,cr2
	push eax
	call _int0e
	add esp,12
	popad
	add esp,4
	.fin:
	;hlt
	;jmp .fin
	iretd
_int0d_asm:
	pushad
	push dword [esp+40]
	push dword [esp+40]
	push dword [esp+40]
	call _int0d
	popad
	add esp,4
	.fin:
	;hlt
	;jmp .fin
	iretd
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
	mov [ebx+4],ss
	mov [ebx],esp
	add esp,60		;esp+4+20+32+12
	mov ebx,[esp+8]
	mov esp,[ebx]
	mov ss,[ebx+4]
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
	mov [ebx+16],esp
	mov [ebx+20],ss
	mov esp,[ebx+8]
	mov ss,[ebx+12]
	mov edx,[ebx]
	mov ecx,[ebx+4]
	mov ax,[ebx+12]
	add ax,8
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
	push ecx
	push edx
	push ebx
	push ebx
	call far [esp+8]
	add esp,4
	pop ebx
	add esp,8
	mov eax,8
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
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
	pop ds
	pop es
	pop fs
	pop gs
	popad
	iretd
	.ret:
	ret