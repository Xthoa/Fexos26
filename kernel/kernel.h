#include <stdarg.h>
#pragma pack(1)

#define NULL 0
#define Bool char
#define True 1
#define False 0
#define Byte char
#define Word short
#define Dword int
#define Dwordu unsigned int
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
#define VRAM bootinfo->vram

#define BLACK 0
#define BLUE 0x000f
#define GREEN 0x03e0
#define RED 0x7800
#define GREY 0x7bef
#define SILVER 0xbdf7
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
} Idt,Gate;
typedef struct _FIFO{
	int len;
	volatile int read,write;
	int* buf;
	int flag;
} Buffer,Cache,Fifo,Pipe,File;
typedef struct _REGS{
	int ds,es,fs,gs;
	int edi,esi,ebp,esp,ebx,edx,ecx,eax;
	int eip,cs,eflags;
} REGS;
typedef struct _TCB{
	REGS* regs;
	int ss;
	int acs,key;
	int tid,sel,flag;
	int* pte;
	char* name;
	Cache* c;
} TCB,Task,*Htask;
typedef struct _FREEINFO{
	Dwordu addr,size;
} Freeinfo;
typedef struct _GMM{
	Freeinfo *root;
	int size;		//MAX=498
	int max;
} GMM,Allocator;
typedef struct _ARDS{
	Qword base;
	Qword len;
	Dword type;
} ARDS;
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
	short vbemode;		//0x50e
	ARDS ards[16];	//0x510-0x64f
	struct{		//68
		int max_func;
		int max_ext_func;
		char vendor[12];
		char name[48];
	}pack cpuid;	//0x650-0x693
	int os_usable_pages;	//0x694
	int vram;	//0x698
	short scrx,scry;	//0x69c
} BootInfo;
typedef struct _StaticFILE{
	char flag;
	char name[23];
	int len;
	int pos;
} StaticFile,FileInfo;
typedef struct _FS{
	int filecnt;
	StaticFile* start;
} FS;
typedef struct _PROG{
	int eip,cs;
	int esp,ss;
	int sesp,sss;
	int acs,key;
} App,Program,Instance;
typedef struct __CURPOS{
	int x;
	int y;
	int lim;
} Curpos;
typedef struct _APPOPT{
	enum Incac{
		SELF=1,FATHER,SYS
	} incac;
	enum Waits{
		CONTINUE=1,WAIT,WAIT_SEND,WAIT_SEND_HLT
	} waits;
	enum Io{
		NONE=1,KBDIN,SCRNOUT,ALL
	} io;
} AppOption;
typedef struct __GDTR{
	Word len;
	Dword base;
} _Gdtr;

extern Cache* kbdcac;
extern Allocator* allocr;
extern Curpos curpos;
extern Cache* stdout;
extern Bool kbd_flag;
extern Dword clock;
extern TaskTab tasktab;
extern BootInfo* bootinfo;
extern FS fs;
extern int segcnt;
extern Allocator gdtaloc;
extern _Gdtr gdtr;
extern char* sysfont;
extern int scrx,scry;

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
void app_startup_asm(App* a,int argc);
void destart(Htask t);

void interr00();
void interr01();
void interr03();
void interr04();
void interr05();
void interr06();
void interr07();
void interr08();
void interr0a();
void interr0b();
void interr0c();
void interr10();
void interr11();
void interr12();
void interr13();

void entry();
void cls_bg();
void cpuids();
void manager();

void set_gatedesc(int no,int off,int sel,int param,int attr);
void int21(int code);
void int3(); 
void int0e(int cr2,int code,int eip,int cs);
void int0d(int code,int eip,int cs);
void int20();
void enable_pic(int irq);
void init_pit();
char* push_page(char* raw,int pages);
char* pop_page(int pages);
char* global_page(char* raw,int start,int pages);
char* local_page(int* pde,int* pte,char* raw,int pte_n,int start,int pages);
void set_segmdesc(int no,int base,int limit,int attr);
void app_startup(char* name,char* args,Htask father,AppOption ao);

void dispchar(int row,int col,char ch,short back,short color);
char transdig(int dig);
int puts(const char* str);
int printf(const char* format,...);
void putint(int val,int dig);
void putdec(int val,int dig);
void putch(int c);
int putstr(const char* str);
void oputch(char c);

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
void* alloc(Allocator* alocr,int size);
void* alloc_page(Allocator* alocr,int pages);

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
int int31api(int eax,int ebx,int ecx,int edx,int esi,int edi);
void int30_asm();
void int31_asm();

void init_fs();
StaticFile* fopen(char* name);
char* filepos(StaticFile* f);
