bits 32
section .text
global _cls
_cls:
	mov eax,16
	int 0x31
	ret
global _clcur
_clcur:
	mov eax,15
	int 0x31
	ret
global _cls_cur
_cls_cur:
	mov eax,17
	int 0x31
	ret