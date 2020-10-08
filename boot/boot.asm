;boot.asm
;fexos 26
bits 16
%include "desc.inc"
org 07c00h
Cylinders equ 3
;2.read floppy to 0xb000 from sector[1]
mov ax,0x0b00
mov es,ax
mov ax,0x7b0
mov ss,ax
mov sp,0x100
;mov word [0x504],0
		MOV		CH,0			; シリンダ0
		MOV		DH,0			; ヘッド0
		MOV		CL,2	
readloop:
		MOV		AH,0x02			; AH=0x02 : ディスク読み込み
		MOV		AL,1			; 1セクタ
		MOV		BX,0
		MOV		DL,0x00	
;add word [0x504],1
int 13h
jc err
		MOV		AX,ES			; アドレスを0x200進める
		ADD		AX,0x0020
		MOV		ES,AX			; ADD ES,0x020 という命令がないのでこうしている
		ADD		CL,1			; CLに1を足す
		CMP		CL,18			; CLと18を比較
		JBE		readloop		; CL <= 18 だったらreadloopへ
		MOV		CL,1
		ADD		DH,1
		CMP		DH,2
		JB		readloop		; DH < 2 だったらreadloopへ
		MOV		DH,0
		ADD		CH,1
		CMP		CH,Cylinders
		JB		readloop
next:
;3.set segreg & stack
mov ax,cs
mov ds,ax
mov es,ax
mov fs,ax
mov gs,ax
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
;vbe
mov ax,0x3e0
mov es,ax
mov di,0
mov ax,0x4f01
mov cx,0x117
int 0x10
mov ax,[0x3e12]
mov [0x69c],ax
mov ax,[0x3e14]
mov [0x69e],ax
mov eax,[0x3e28]
mov [0x698],eax
mov ax,0x4f02
mov bx,0x117
add bx,0x4000
int 0x10
mov ax,0x117
mov word [0x50e],ax
mov ax,0x3e0
mov es,ax
mov di,0
mov ax,0
mov cx,256
rep stosb
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

rderr:
	db "Read Disk Error",0x0a,0
memerr:
	db "Memory Test Error",0x0a,0
errs:
	db "Press to stop.",0x0a,0
damnvbe:
	db "What's wrong with your VGA",0x0a,0
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
times 510-($-$$) nop
dw 0xaa55