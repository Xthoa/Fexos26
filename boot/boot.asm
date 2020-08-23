;boot.asm
;fexos 26
bits 16
%include "desc.inc"
org 07c00h
Sectors equ 18
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
mov al,2	;sectors count
xor dl,dl
add word [0x504],2
int 13h
jc err
cmp word [0x504],Sectors
jz next
mov ax,es
add ax,0x40
mov es,ax
add cl,2
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
loop:
mov eax,0xE820
mov edx,0x534D4150
mov ecx,20
int 15h
jc fail
add di,20
inc word [0x502]
or ebx,ebx
jnz loop
;7.clear int
cli
;8.load gdtr
lgdt [gdtr]
;9.jmp to loader
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
	Descriptor 0,0xFFFFF,SEG_DATA
	Descriptor 0,0xFFFFF,SEG_CODE
gdtr:
	dw 8*3-1
	dd GDTR

%include "rmio.inc"

file_end:
times 510-($-$$) db 0
dw 0xaa55