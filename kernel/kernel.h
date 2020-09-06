#include <stdarg.h>
#pragma pack(1)

#define NULL 0
#define Bool char
#define True 1
#define False 0
#define Byte char
#define Word short
#define Dword int
#define Qword long long
#define Usnd unsigned
#define Ptr *
#define Dwptr int
#define size_t int
#define elif else if
#define pack __attribute__((packed))

#define MBR 0x7c00
#define IPL MBR
#define TMP_PG_STACK 0x4000
#define PDE 0x8000
#define PTE 0x9000
#define GDT ((Descriptor*)0xa000)
#define IDT ((Gate*)0xa800)
#define DISK 0xb000
#define VRAM 0xB8000

#define BLACK 0
#define BLUE 1
#define GREEN 2
#define RED 4
#define GREY 7
#define LIGHT 8
#define WHITE 15

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

#define MAX_GLOB_ALOCR_TAB 398
#define MAX_TASKS 256
#define PAGE_SIZE 4096

typedef enum _KBD{
	KEY_ESC=0x80,
	KEY_CTRL_L,KEY_CTRL_R,KEY_SHIFT_L,KEY_SHIFT_R,KEY_ALT_L,KEY_ALT_R,
	KEY_CAPS,KEY_NUM,KEY_SCROL,
	KEY_F1,KEY_F2,KEY_F3,KEY_F4,KEY_F5,KEY_F6,KEY_F7,KEY_F8,KEY_F9,KEY_F10,KEY_F11,KEY_F12,
	KEY_SYS,KEY_HOME,KEY_END,KEY_PGUP,KEY_PGDN,KEY_UP,KEY_DOWN,KEY_LEFT,KEY_RIGHT,
	KEY_INS,KEY_DEL,KEY_PRINT_SCR,KEY_PRINT_SCR2,KEY_GUI_L,KEY_GUI_R,
	KEY_APPS,KEY_POWER,KEY_SLEEP,KEY_WAKE,KEY_PAD_ENTER,
	KEY_PAD_HOME,KEY_PAD_END,KEY_PAD_PGUP,KEY_PAD_PGDN,
	KEY_PAD_UP,KEY_PAD_DOWN,KEY_PAD_LEFT,KEY_PAD_RIGHT,
	KEY_PAD_INS,KEY_PAD_DEL
} KBD;
typedef struct pack _GDT{
	Word limit;
	Word base;
	Byte base2;
	Word atrlmt;
	Byte base3;
} Gdt,Descriptor;
typedef struct _IDT{
	Word off;
	Word sel;
	Byte param;
	Byte attr;
	Word off2;
}pack Idt,Gate;
typedef struct _FIFO{
	int len;
	volatile int read,write;
	int* buf;
	struct _TCB * task;
} Buffer,Cache,Fifo;
typedef struct _REGS{
	int ds,es,fs,gs;
	int edi,esi,ebp,esp,ebx,edx,ecx,eax;
	int eip,cs,eflags;
}pack REGS;
typedef struct _TCB{
	REGS* regs;
	int ss;
	int acs,key;
	int tid,sel,flag;
	int* pte;
	char* name;
	Cache* c;
}pack TCB,Task,*Htask;
typedef struct _FREEINFO{
	int addr,size;
} Freeinfo;
typedef struct _GMM{
	Freeinfo *root;
	int size;		//MAX=498
} GMM,Allocator;
typedef struct _ARDS{
	Qword base;
	Qword len;
	Dword type;
}pack ARDS;
typedef struct _POS{
	int x;
	int y;
} Position;
typedef struct _TASKTAB{
	Htask root;
	Htask *ready;
	int size;
	int now;
} TaskTab;
typedef struct _BOOTINFO{
	short read_sectors;	//0x500
	short boot_file_size;	//0x502
	short ards_count;	//0x504
	struct{		//8
		char min;
		char hour;
		char sec;
		char resv;
		char year;
		char cent;
		char day;
		char month;
	}pack date;	//0x506-0x50d
	short resv;		//0x50e
	ARDS ards[16];	//0x510-0x64f
	struct{		//68
		int max_func;
		int max_ext_func;
		char vendor[12];
		char name[48];
	}pack cpuid;	//0x650-0x693
	int os_usable_pages;	//0x694
}pack BootInfo;
typedef struct _FILE{
	char flag;
	char name[23];
	int len;
	int pos;
}pack File,FileInfo;
typedef struct _FS{
	int filecnt;
	File* start;
} FS;
typedef struct _PROG{
	int eip,cs;
	int esp,ss;
	int sesp,sss;
	int acs,key;
} App,Program;
typedef struct __CURPOS{
	int x;
	int y;
	int lim;
} Curpos;

extern Cache* kbdcac;
extern Allocator* allocr;
extern Curpos curpos;
extern Cache* stdin;
extern Bool kbd_flag;
extern Dword clock;
extern TaskTab tasktab;
extern BootInfo* bootinfo;
extern FS fs;
extern int segcnt;

void* memset(void* dst,int val,int size);
void int21_asm();
void hlt();
void out8(int port,int data);
int strlen(const char* str);
void int3_asm();
void int0e_asm();
void int0d_asm();
void cpuid(int eax,int* buf);
void int20_asm();
void restart(Htask a,Htask b);
void delay(int time);
void write_cr3(int cr3);
int strcmp(char* dst,char* src);
void app_startup_asm(App* a);
void destart(Htask t);

void entry();
void cls_bg();
void cpuids();
void task_b();

void set_gatedesc(int no,int off,int sel,int param,int attr);
void int21(int code);
void int3(); 
void int0e(int cr2,int code,int eip);
void int0d(int code,int cs,int eip);
void int20();
void enable_pic(int irq);
void init_pit();
char* push_page(char* raw,int start,int pages);
char* local_page(int* pde,int* pte,char* raw,int pte_n,int start,int pages);
void set_segmdesc(int no,int base,int limit,int attr);
void app_startup(char* name);

void putchar(int row,int col,char ch,char color);
void dispstr(int x,int y,const char* str,char col);
void putdigit(int x,int y,unsigned int dig,char col);
void dispint(int x,int y,int dig,int val,char col);
int puts(const char* str);
int printf(const char* format,...);
void putint(int val,int dig);
void dispdec(int x,int y,int dig,int val,char col);
void putdec(int val,int dig);
void putch(char c);
int putstr(const char* str);

void init_allocator();
void* malloc(int size);
void* malloc_page(int pages);
void free(void* memory,int size);
void free_page(int mem,int pages);
int mem_left();
void vramcpy(Position dst,Position src,int len);
void vrammove(Position dst,Position src,int len);
void* memcpy(void* dst,void* src,int size);
void* memmove(void* dst,void* src,int size);
void disp_mem();

void fifo_init(Cache* c,int* buf,int len);
int fifo_size(Cache* c);
int read_cache(Cache* c);
void write_cache(Cache* c,int data);
int read_cache_wait(Cache* c);
void write_cache_wait(Cache* c,int data);

void init_mt();
Htask create_task(char* name);
void task_init(Htask task,int eip);
void task_ready(Htask task);
Htask task_now();
void task_switch(Htask task);
void disable_page(int base,int pages);
Htask search_task(int tid);
Htask find_task(int tid);
void schedule();

int apideliv(int ino,int edi,int esi,int ebp,int esp,int ebx,int edx,int ecx,int eax);
void int30api();
int int31api(int eax,int ecx,int edx,int esi);
void int30_asm();
void int31_asm();

void init_fs();
File* fopen(char* name);
char* filepos(File* f);
