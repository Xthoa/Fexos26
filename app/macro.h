//macro.h
#pragma pack(1)
#define Bool int
#define True 1
#define False 0
#define elif else if
#define NULL 0
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
typedef struct _TCB{
	int regs;
	int ss;
	int acs,key;
	int tid,sel,flag;
	int* pte;
	char* name;
	int c;
} *Htask;
typedef struct _FIFO{
	int len;
	volatile int read,write;
	int* buf;
	int flag;
} Buffer,Cache,Fifo,Pipe,File;
typedef struct _StaticFILE{
	char flag;
	char name[23];
	int len;
	int pos;
} StaticFile,FileInfo;
