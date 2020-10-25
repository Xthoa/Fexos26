//types.h
#pragma once
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
} Buffer,Cache,Fifo,Pipe,File,DynamicFile;
typedef struct _FIFO8{
	int len;
	volatile int read,write;
	char* buf;
	int flag;
} Cache8,Fifo8,Pipe8,File8;
typedef struct _REGS{
	int ds,es,fs,gs;
	int edi,esi,ebp,esp,ebx,edx,ecx,eax;
	int eip,cs,eflags;
} REGS;
typedef struct _TCB{
	REGS* regs;
	int ss;
	int cr3;
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
	} date;	//0x506-0x50d
	short vbemode;		//0x50e
	ARDS ards[16];	//0x510-0x64f
	struct{		//68
		int max_func;
		int max_ext_func;
		char vendor[12];
		char name[48];
	} cpuid;	//0x650-0x693
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
} App,Program;
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
typedef struct _INST{
	App a;
	int cr3;
	struct _INST* self;
	char *dataglob;
	int startesp;
	char *cmdline_loc;
	char *workdir;
	struct PageMap{
		int pde,pdelin,pte0,pte0lin,pte1,pte1lin;
	};
	struct PageMap pm;
} Instance;
typedef struct _INSTEX{
	char cmdline[64];
	char workdir[64];
} InstanceEx;
