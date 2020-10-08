;loader.asm
;fexos 26
bits 16
%include "desc.inc"
org 0b000h

;1.open cr0.pe
mov eax,cr0
or eax,1
mov cr0,eax
;2.jmp to 32
jmp dword 16:Sec32
bits 32
Sec32:
;3.init segreg
mov ax,8
mov ds,ax
mov es,ax
mov fs,ax
mov gs,ax
;4.set stack
mov ss,ax
;5.init page dir lv.2
mov ebx,PTE
mov eax,PTE_4K
mov ecx,512
.loop1:
mov [ebx],eax
add ebx,4
add eax,0x1000
loop .loop1
;6.init page tab lv.1
mov dword [PDE],PDE_TAB+PTE
;7.open paging
mov eax,PDE
mov cr3,eax
mov eax,cr4
or eax,010000b
mov cr4,eax
mov eax,cr0
or eax,0x80000000
mov cr0,eax
jmp next
next:
;8.move idt
mov esi,idt
mov edi,IDTR
mov ecx,8*0x40
cld
rep movsb
;9.load idt
lidt [idtr]
;10.init pic icw1
mov al,0x11
out 0x20,al
nop
out 0xa0,al
;11.icw2
mov al,0x20
out 0x21,al
add al,8
out 0xa1,al
;12.icw3
mov al,00000100b
out 0x21,al
mov al,2
out 0xa1,al
;13.icw4
mov al,1
out 0x21,al
nop
out 0xa1,al
;14.ocw1
mov al,001111001b
out 0x21,al
mov al,011111111b
out 0xa1,al
;15.allow int
sti
;16.set c stack
mov [07b00h],esp
mov esp,07b00h
;17.call c main proc
call 0xb400
jmp $

dispintmsg:
	push ecx
	mov eax,160
	mov esi,intmsg
	mov ecx,6
	call putsl
	pop edx
	mov ecx,2
	call putint
	ret
aints:
ints equ aints-$$+0xb000
	xor ecx,ecx
	call dispintmsg
	iretd
aint_08:
int_08 equ aint_08-$$+0xb000
	mov ecx,8		;#DF double fault
	call dispintmsg
	add esp,4
	iretd
aint_0b:
int_0b equ aint_0b-$$+0xb000
	mov ecx,0x0b	;#NP segment not present
	call dispintmsg
	add esp,4
	iretd
aint_0d:
int_0d equ aint_0d-$$+0xb000
	mov ecx,0x0d	;#GP general protection
	call dispintmsg
	add esp,4
	iretd
aint_0e:
int_0e equ aint_0e-$$+0xb000
	mov ecx,0x0e	;#PF page fault
	call dispintmsg
	add esp,4
	iretd
aint_u:
int_u equ aint_u-$$+0xb000
	mov ecx,0xff
	call dispintmsg
	iretd
irqback:
	mov al,0x20
	out 0x20,al
	ret
aint_21:
int_21 equ aint_21-$$+0xb000
	call irqback
	in al,0x60
	mov edx,eax
	mov eax,320
	mov cl,2
	call putint
	iretd
aint_27:
int_27 equ aint_27-$$+0xb000
	call irqback
	iretd

%include "pmio.inc"

idtr:
	dw 8*0x40-1
	dd IDTR
intmsg:
	db "Int 0x"
idt:
%rep 6
	Gate ints,16,0,GATE_INT
%endrep
%rep 2
	Gate int_u,16,0,GATE_INT
%endrep
	Gate int_08,16,0,GATE_INT
	Gate ints,16,0,GATE_INT
	Gate ints,16,0,GATE_INT
	Gate int_0b,16,0,GATE_INT
	Gate ints,16,0,GATE_INT
	Gate int_0d,16,0,GATE_INT
	Gate int_0e,16,0,GATE_INT
%rep 0x12
	Gate ints,16,0,GATE_INT
%endrep
	Gate int_21,16,0,GATE_INT
%rep 5
	Gate ints,16,0,GATE_INT
%endrep
	Gate int_27,16,0,GATE_INT
%rep 0x18
	Gate ints,16,0,GATE_INT
%endrep