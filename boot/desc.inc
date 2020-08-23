;desc.inc
%macro Descriptor 3
	dw %2 & 0FFFFh
	dw %1 & 0FFFFh
	db ( %1 >> 16) & 0FFh
	dw (( %2 >> 8) & 0F00h) | ( %3 & 0F0FFh)
	db ( %1 >> 24) & 0FFh
%endmacro
;Descriptor Base(32),Limit(20),Attributes(macros)
GDTR equ 0xa000
SEG_RPL equ 1
DPL equ 0x20
SEG32 equ 0x4000
SEG_PG4K equ 0x8000
SEG_P equ 0x80
SEG_SEG equ 0x10
SEG_AC equ 0x1	;access
SEG_RW equ 0x2
SEG_DR equ 0x4	;direction
SEG_EX equ 0x8

SEG_BASE equ SEG32|SEG_P|SEG_SEG
SEG_DATA equ SEG_BASE|SEG_RW|SEG_PG4K
SEG_CODE equ SEG_BASE|SEG_RW|SEG_EX|SEG_PG4K

PAGE_P equ 1
PAGE_RW equ 2
PAGE_USER equ 4
PGBASE equ 3

PDE_4M equ 0x80|PGBASE
PDE_TAB equ PGBASE
PTE_4K equ PGBASE
PDE equ 08000h
PTE equ 09000h

%macro Gate 4
	dw %1 & 0xffff
	dw %2
	db %3 & 0x1f
	db %4
	dw ( %1 >> 16) & 0xffff
%endmacro
;Gate Offset(32),Selector(16),Paramcnt(5),Attribute(macros)
GATE32 equ 0x8
GATE_P equ 0x80
GATEA_INT equ 0x6
GATEA_TRAP equ 0x7
GATEA_TASK equ 0x5
;GATE_TASK must not be with GATE32

GATE_BASE equ GATE_P|GATE32
GATE_INT equ GATE_BASE|GATEA_INT
IDTR equ 0xa800