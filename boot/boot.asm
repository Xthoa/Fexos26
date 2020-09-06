;boot.asm
;fexos 26
bits 16
%include "desc.inc"
org 07c00h
Sectors equ 36
;1.print boot message
mov si,msg
call puts
cli
;2.read floppy to 0xb000 from sector[1]
mov ax,0x0b00
mov es,ax
mov word [0x504],0
xor bx,bx
xor dx,dx	;head 0
mov cx,2	;sector 2 ; cylinder 0
read:
mov ah,2	;function
mov al,1	;sectors count
xor dl,dl
add word [0x504],1
int 13h
jc err
cmp word [0x504],Sectors
jz next
mov ax,es
add ax,0x20
mov es,ax
inc cl
cmp cl,18
jbe read
mov cl,1
add dh,1
cmp dh,2
jb read
mov dh,1
add ch,1
jmp read
next:
;3.set segreg & stack
mov ax,cs
mov ds,ax
mov es,ax
mov fs,ax
mov gs,ax
mov ax,0x7b0
mov ss,ax
mov sp,0x100
;4.move gdt to 0xa000
mov cx,0x18
mov si,gdt
mov di,0xa000
cld
rep movsb
;5.store file real size
mov word [0x500],file_end-$$
;6.check memory
mov word [0x502],0
mov di,0x510
xor bx,bx
_loop:
mov eax,0xE820
mov edx,0x534D4150
mov ecx,20
int 15h
jc fail
add di,20
inc word [0x502]
or ebx,ebx
jnz _loop
;7.get freq
mov ah,2
int 1ah
mov word [0x506],cx
mov byte [0x508],dh
mov ah,4
int 1ah
mov word [0x50a],cx
mov word [0x50c],dx
clc
;7.clear int
cli
;8.load gdtr
lgdt [gdtr]
;9.open a20
in al,92h
or al,010b
out 92h,al
;10.jmp to loader
jmp 0b000h

fail:
mov si,memerr
call puts
jmp fin
err:
mov si,rderr
call puts
mov si,errs
call puts
call getch
fin:
cli
hlt
jmp fin

msg:
	db "Booting...",0
rderr:
	db "Read Disk Error;",0x0a
memerr:
	db "Memory Test Error;",0x0a
errs:
	db "Press any key to stop...",0
gdt:
	Descriptor 0,0,0
	;null
	Descriptor 0,0xFFFFF,SEG_DATA|SEG_PG4K
	;data
	Descriptor 0,0xFFFFF,SEG_CODE|SEG_PG4K
	;code32
	Descriptor 0,0xffff,SEG_P|SEG_SEG|SEG_RW|SEG_EX
	;code16
	Descriptor 0,0xffff,SEG_DATA
	;normal
gdtr:
	dw 8*0x10-1
	dd GDTR

%include "rmio.inc"

file_end:
times 510-($-$$) db 0
dw 0xaa55