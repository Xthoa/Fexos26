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
#define elif else if
#define pack __attribute__((packed))

#define DISK 0x7c00
#define PDE 0x9000
#define PTE 0xa000
#define GDT ((Descriptor*)0xb000)
#define IDT ((Gate*)0xb800)
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
#define SEG_BASE DESC_P|SEG32
#define SEG_DATA SEG_BASE|SEG_RW|SEG_PG4K
#define SEG_CODE SEG_BASE|SEG_RW|SEG_EX|SEG_PG4K

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
typedef struct _GDT{
	Word limit;
	Word base;
	Byte base2;
	Byte attr;
	Byte atrlmt;
	Byte base3
}pack Gdt,Descriptor;
typedef struct _IDT{
	Word off;
	Word sel;
	Byte param;
	Byte attr;
	Word off2;
}pack Idt,Gate;
typedef struct _FIFO{
	int len,read,write;
	int* buf;
} Buffer,Cache,Fifo;

extern Cache* kbdcac;

void int21_asm();
void hlt();
void out8(int port,int data);

void putchar(int row,int col,char ch,char color);
void dispstr(int x,int y,char* str,char col);
void putdigit(int x,int y,unsigned int dig,char col);
void dispint(int x,int y,int dig,int val,char col);
void cls_bg();
void int21(int code);
void fifo_init(Cache* c,int* buf,int len);
int fifo_size(Cache* c);
int read_cache(Cache* c);
void write_cache(Cache* c,int data);
void set_gatedesc(int no,int off,int sel,int param,int attr);
void print_kbd_code(int code);
