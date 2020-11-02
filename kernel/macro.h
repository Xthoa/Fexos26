//macro.h
#pragma once

#define MBR 0x7c00
#define IPL MBR
#define TMP_PG_STACK 0x4000
#define PDE 0x8000
#define PTE 0x9000
#define GDT ((Descriptor*)0xa000)
#define IDT ((Gate*)0xa800)
#define DISK 0xb000
#define VRAM bootinfo->vram

#define BLACK 0
#define BLUE 0x000f
#define GREEN 0x03e0
#define RED 0x7800
#define GREY 0x7bef
#define SILVER 0xc618
#define LIGHTB 0x0010
#define LIGHTG 0x0400
#define LIGHTR 0x8000
#define LIGHT LIGHTR|LIGHTG|LIGHTB
#define WHITE 0xffff

#define SEG_RPL 1
#define DPL 0x20
#define SEG32 0x4000
#define SEG_PG4K 0x8000
#define DESC_P 0x80
#define SEG_SEG 0x10
#define SEG_AC 1
#define SEG_RW 2
#define SEG_DR 4
#define SEG_EX 8
#define SEG_BASE DESC_P|SEG32|SEG_SEG
#define SEG_DATA SEG_BASE|SEG_RW
#define SEG_CODE SEG_BASE|SEG_RW|SEG_EX

#define PAGE_P 1
#define PAGE_RW 2
#define PAGE_USER 4
#define PGBASE 3
#define PDE_4M 0x80|PGBASE
#define PDE_TAB PGBASE
#define PTE_4K PGBASE

#define GATE32 0x8
#define GATEA_INT 0x6
#define GATEA_TRAP 0x7
#define GATEA_TASK 0x5
#define GATE_BASE DESC_P|GATE32
#define GATE_INT GATE_BASE|GATEA_INT

#define MAX_TASKS 256
#define PAGE_SIZE 4096

#define MSG_TASK_CHILDFIN 0x100
#define MSG_TASK_EXIT 0x101
#define MSG_TASK_DESTROY 0x102
