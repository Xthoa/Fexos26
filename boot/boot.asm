;boot.asm
;fexos 26
bits 16
%include "desc.inc"
org 07c00h

;1.print boot message
mov si,msg
call puts
cli
;2.read floppy to 0x7e00 from sector[1]
mov ax,0x07e0
mov es,ax
xor bx,bx
mov ah,2	;function
mov al,9	;sectors count
xor dx,dx	;head 0
mov cx,2	;sector 2 ; cylinder 0
int 13h
jc err
;3.set segreg & stack
mov ax,cs
mov ds,ax
mov es,ax
mov fs,ax
mov gs,ax
mov ax,0x7b0
mov ss,ax
mov sp,0x100
;4.move gdt to 0xb000
mov cx,0x18
mov si,gdt
mov di,0xb000
cld
rep movsb
;5.store file real size
mov word [0x600],file_end-$$
;6.jmp to loader
jmp 07e00h

err:
mov si,errmsg
call puts
call getch
fin:
hlt
jmp fin

msg:
	db "Booting...",0
errmsg:
	db "Read Disk Error;",0x0a
	db "Press any key to stop...",0
gdt:
	Descriptor 0,0,0
	Descriptor 0,0xFFFFF,SEG_DATA
	Descriptor 0,0xFFFFF,SEG_CODE

%include "rmio.inc"

file_end:
times 510-($-$$) db 0
dw 0xaa55