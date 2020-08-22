#include "kernel.h"
__attribute__((section(".entry")))
void entry(){
	cls_bg();
	Cache cac;
	int buf[64];
	fifo_init(&cac,buf,64);
	kbdcac=&cac;
	set_gatedesc(0x21,(int)int21_asm,16,0,GATE_INT);
	dispstr(0,0,"Welcome to Fexos 1.0",GREY);
	while(1){
		if(fifo_size(&cac)==0){
			hlt();
			continue;
		}
		print_kbd_code(read_cache(&cac));
	}
}
void putchar(int row,int col,char ch,char color){
	*(char*)(VRAM+row*160+col*2+1)=color;
	*(char*)(VRAM+row*160+col*2)=ch;
}
void dispstr(int x,int y,char* str,char col){
	while(*str){
		char c=*str;
		if(c=='\n')x++,y=0;
		elif(c=='\r')y=0;
		elif(c=='\b')y--;
		elif(c=='\t')y=(y|3)+1;
		else putchar(x,y,*str,col);
		str++;
		y++;
		if(y==80)x++,y=0;
	}
}
void putdigit(int x,int y,unsigned int dig,char col){
	if(dig>9)putchar(x,y,dig+'A'-10,col);
	else putchar(x,y,dig+'0',col);
}
void dispint(int x,int y,int dig,int val,char col){
	y+=dig;
	for(;dig;dig--,y--){
		putdigit(x,y,(unsigned int)val%16,col);
		val>>=4;
	}
}
void cls_bg(){
	memset((void*)VRAM,0,80*25*2);
}
Cache* kbdcac;
void int21(int code){
	write_cache(kbdcac,code);
}
void fifo_init(Cache* c,int* buf,int len){
	c->buf=buf;
	c->read=c->write=0;
	c->len=len;
}
int fifo_size(Cache* c){
	int ret=c->write-c->read;
	if(ret<0)ret=c->len-ret;
	return ret;
}
int read_cache(Cache* c){
	if(c->write==c->read)return 0;
	int ret=c->buf[c->read];
	c->read++;
	if(c->read==c->len)c->read=0;
	return ret;
}
void write_cache(Cache* c,int data){
	if(c->write==(c->read-1))return;
	c->buf[c->write]=data;
	c->write++;
	if(c->write==c->len)c->write=0;
}
void set_gatedesc(int no,int off,int sel,int param,int attr){
	Gate* gt=(IDT+no);
	gt->off=off&0xffff;
	gt->off2=off>>16;
	gt->sel=sel&0xffff;
	gt->param=param;
	gt->attr=attr;
}
Bool kbd_flag;//flag=paused-cnt ctrl alt caps !num shift e0
void print_kbd_code(int code){
	static const char keytabs0[0x59]={
		0,KEY_ESC,'1','2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '\b',  '\t',
		'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',  KEY_CTRL_L, 'a', 's',
		'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`',KEY_SHIFT_L,'\\', 'z', 'x', 'c', 'v',
		'b','n','m',',','.','/',KEY_SHIFT_R,'*',KEY_ALT_L,' ',KEY_CAPS,KEY_F1,KEY_F2,KEY_F3,KEY_F4,KEY_F5,
		KEY_F6,KEY_F7,KEY_F8,KEY_F9,KEY_F10,KEY_NUM,KEY_SCROL,'7','8','9', '-', '4', '5', '6', '+', '1',
		'2', '3', '0', '.',KEY_SYS,0,0,KEY_F11,KEY_F12
	};
	static const char keytabs1[0x59]={
		0,KEY_ESC,'!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '\b', '\t',
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '{', '}', '\n', KEY_CTRL_L, 'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '\"', '~',KEY_SHIFT_L,'|', 'Z', 'X', 'C', 'V',
		'B', 'N', 'M', '<', '>', '?',KEY_SHIFT_R,'*',KEY_ALT_L,' ',KEY_CAPS,KEY_F1,KEY_F2,KEY_F3,KEY_F4,KEY_F5,
		KEY_F6,KEY_F7,KEY_F8,KEY_F9,KEY_F10,KEY_NUM,KEY_SCROL,KEY_PAD_HOME,
			KEY_PAD_UP,KEY_PAD_PGUP,'-',KEY_PAD_LEFT,0,KEY_PAD_RIGHT,'+',KEY_PAD_END,
		KEY_PAD_DOWN,KEY_PAD_PGDN,KEY_PAD_INS,KEY_PAD_DEL,KEY_SYS,0,0,KEY_F11,KEY_F12
	};
	static const char keytabs2[0x64]={
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,KEY_PAD_ENTER,KEY_CTRL_R,0,0,
		0,0,0,0,0,0,0,0,0,0,KEY_PRINT_SCR,0,0,0,0,0,
		0,0,0,0,0,'/',0,KEY_PRINT_SCR2,KEY_ALT_R,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,
			KEY_HOME,KEY_UP,KEY_PGUP,0,KEY_LEFT,0,KEY_RIGHT,0,KEY_END,
		KEY_DOWN,KEY_PGDN,KEY_INS,KEY_DEL,
		0,0,0,0,0,0,0,KEY_GUI_L,KEY_GUI_R,KEY_APPS,KEY_POWER,KEY_SLEEP,
		0,0,0,KEY_WAKE
	};
	static const char* keystrs[]={
		"ESC","Ctrl-l","Ctrl-r","Shift-l","Shift-r","Alt-l","Alt-r",
		"CapsLk","NumsLk","ScrLk",
		"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",
		"SysReq","Home","End","PageUp","PageDown","Up","Down","Left","Right",
		"Insert","Delete","","PrtScr","Gui-l","Gui-r",
		"Apps","Power","Sleep","Wake","KP Enter","KP "
	};
	unsigned char key;
	dispint(3,8,2,kbd_flag,15);
	if(code==0xe1)dispstr(2,3,"Pause",RED|LIGHT),kbd_flag+=64;
	elif(code==0xe0)kbd_flag|=1;
	elif(code>=0x80){
		if(code==0xaa || code==0xb6)kbd_flag&=-3;
		return;
	}
	elif((kbd_flag>>6)!=0)kbd_flag+=64;
	else{
		if((kbd_flag&1)==1)key=keytabs2[code];
		else if((kbd_flag&2)==2 || ((kbd_flag&4)==4 && code>=0x47 && code<=0x53))key=keytabs1[code];
		else key=keytabs0[code];
		if((kbd_flag&8)==8){
			if(key>='A' && 'Z'>=key)key+=0x20;
			elif('a'<=key && key<='z')key-=0x20;
		}
		dispint(3,0,2,code,WHITE);
		dispint(3,4,2,key,WHITE);
		kbd_flag&=-2;
		if(key==KEY_SHIFT_L || key==KEY_SHIFT_R)kbd_flag|=2;
		elif(key==KEY_NUM)kbd_flag^=4;
		elif(key==KEY_CAPS)kbd_flag^=8;
		elif(key==KEY_ALT_L || key==KEY_ALT_R)kbd_flag^=16;
		elif(key==KEY_CTRL_L || key==KEY_CTRL_R)kbd_flag^=32;
		if(key>=0x80 && key<=KEY_PAD_ENTER)dispstr(2,3,keystrs[key-0x80],GREY);
		elif(key>KEY_PAD_ENTER)dispstr(2,3,keystrs[key-0x93],GREY);
		else putchar(2,0,key,WHITE);
	}
}
