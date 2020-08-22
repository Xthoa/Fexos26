;rmio.inc
puts:
	push si
	push bx
L0:
	mov al,[si]
	inc si
	cmp al,0
	jz L1
	mov ah,0eh
	mov bx,000fh
	int 10h
	jmp L0
L1:
	pop bx
	pop si
	ret
getch:
	xor ah,ah
	int 16h
	ret