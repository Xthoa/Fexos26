;pmio.inc
;fexos 26
bits 32
VRAM equ 0B8000h
putchar:
	;eax=pos dx=char
	mov dh,15
	mov word [eax+VRAM],dx
	ret
putsl:
	;eax=pos esi=str ecx=len
	push esi
	.put:
	mov edx,[esi]
	call putchar
	add eax,2
	inc esi
	loop .put
	pop esi
	ret
putdigit:
	;eax=pos edx=value default using hex
	cmp edx,9
	jg ap
	add edx,0x30
	call putchar
	ret
	ap:
	add edx,0x37
	call putchar
	ret
putint:
	;eax=pos edx=value ecx=digits default using hex
	add eax,ecx
	add eax,ecx
	push eax
	add eax,-2
	.loop:
	push edx
	and edx,0xf
	call putdigit
	pop edx
	shr edx,4
	add eax,-2
	loop .loop
	pop eax
	ret