#include "kernel.h"
Bool kbd_flag;	//0 !insert ctrl alt caps !num shift e0
__attribute__((section(".entry")))
void entry(){
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
		KEY_F6,KEY_F7,KEY_F8,KEY_F9,KEY_F10,KEY_NUM,KEY_SCROL,KEY_PAD_HOME,KEY_PAD_UP,KEY_PAD_PGUP,'-',KEY_PAD_LEFT,0,KEY_PAD_RIGHT,'+',KEY_PAD_END,
		KEY_PAD_DOWN,KEY_PAD_PGDN,KEY_PAD_INS,KEY_PAD_DEL,KEY_SYS,0,0,KEY_F11,KEY_F12
	};
	static const char keytabs2[0x64]={
		0,0,0,0,0,0,0,0,0,0,0,0,KEY_PAD_ENTER,KEY_CTRL_R,0,0,
		0,0,0,0,0,0,0,0,0,0,KEY_PRINT_SCR,0,0,0,0,0,
		0,0,0,0,0,'/',0,KEY_PRINT_SCR2,KEY_ALT_R,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,KEY_HOME,KEY_UP,KEY_PGUP,0,KEY_LEFT,0,KEY_RIGHT,0,KEY_END,
		KEY_DOWN,KEY_PGDN,KEY_INS,KEY_DEL,
		0,0,0,0,0,0,0,KEY_GUI_L,KEY_GUI_R,KEY_APPS,KEY_POWER,KEY_SLEEP,0,0,0,KEY_WAKE
	};
	//1.init screen
	cls_bg();
	curpos.x=curpos.y=0;
	//2.init kbd
	Cache cac;
	int buf[64];
	fifo_init(&cac,buf,64);
	kbdcac=&cac;
	//kdb intr
	set_gatedesc(0x21,(int)int21_asm,16,0,GATE_INT);
	//3.init memory
	init_allocator();
	//4.enable ints
	set_gatedesc(0x03,(int)int3_asm,16,0,GATE_INT);
	set_gatedesc(0x0d,(int)int0d_asm,16,0,GATE_INT);
	set_gatedesc(0x0e,(int)int0e_asm,16,0,GATE_INT);
	//5.init stdin
	Cache input;
	stdin=&input;
	//6.kernel space & vram is not allowed for using
	//total 1M [0x100 Pages] for kernel
	malloc_page(0x100);
	puts("Welcome to Fexos 1.1");
	while(1){
		if(fifo_size(&cac)>0){
			unsigned char key,code=read_cache(&cac);
			if(code==0xe1){
				for(int i=0;i<3;i++)read_cache_wait(&cac);
				pause();
			}
			elif(code==0xe0)kbd_flag|=1;
			elif(code>=0x80){
				if(code==0xaa || code==0xb6)kbd_flag&=-3;
				elif(code==0x38)kbd_flag&=-17;
				elif(code==0x1d)kbd_flag&=-33;
				if((kbd_flag&1)==1)kbd_flag&=-2;
				continue;
			}
			else{
				if((kbd_flag&1)==1)kbd_flag&=-2,key=keytabs2[code-0x10];
				else if((kbd_flag&2)==2 || ((kbd_flag&4)==4 && code>=0x47 && code<=0x53))key=keytabs1[code];
				else key=keytabs0[code];
				if((kbd_flag&8)==8){
					if(key>='A' && 'Z'>=key)key+=0x20;
					elif('a'<=key && key<='z')key-=0x20;
				}
				if(key==KEY_SHIFT_L || key==KEY_SHIFT_R)kbd_flag|=2;
				elif(key==KEY_NUM)kbd_flag^=4;
				elif(key==KEY_CAPS)kbd_flag^=8;
				elif(key==KEY_ALT_L || key==KEY_ALT_R)kbd_flag|=16;
				elif(key==KEY_CTRL_L || key==KEY_CTRL_R)kbd_flag|=32;
				write_cache(stdin,key);
			}
		}
		if(fifo_size(stdin)>0){
			int key=read_cache(stdin);
			if(key<0x80)putch(key);
			elif(key==KEY_PAD_ENTER)putch('\n');
			elif(key==KEY_LEFT || key==KEY_PAD_LEFT)curpos.y?curpos.y--:curpos.y;
			elif(key==KEY_RIGHT || key==KEY_PAD_RIGHT)curpos.y<80?curpos.y++:curpos.y;
			elif(key==KEY_UP || key==KEY_PAD_UP)curpos.x?curpos.x--:curpos.x;
			elif(key==KEY_DOWN || key==KEY_PAD_DOWN)curpos.x<25?curpos.x++:curpos.x;
			elif(key==KEY_INS || key==KEY_PAD_INS)kbd_flag^=64;
			elif(key==KEY_DEL || key==KEY_PAD_DEL)putch(0x7f);
		}
	}
}
void putchar(int row,int col,char ch,char color){
	*(char*)(VRAM+row*160+col*2+1)=color;
	*(char*)(VRAM+row*160+col*2)=ch;
}
void dispstr(int x,int y,const char* str,char col){
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
	y+=dig-1;
	for(;dig;dig--){
		putdigit(x,y--,(unsigned int)val%16,col);
		val>>=4;
	}
}
void putint(int val){
	dispint(curpos.x,curpos.y,8,val,GREY);
	curpos.y+=8;
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
Allocator* allocr;
void init_allocator(){
	static const char* types[]={"Usable","Reserved","ACPI","Sleep","Unexist"};
	int all;
	ARDS *ards=(ARDS*)0x510;
	allocr=(Allocator*)0x2000;
	allocr->root=0x2008; 
	allocr->size=0;
	puts("Memory Map:");
	for(int i=0;i<(*(short*)0x502);i++){
		int tp=ards[i].type;
		printf("%x %x %s\n",(int)ards[i].base,(int)ards[i].len,types[tp-1]);
		if(tp==1){
			all+=(ards[i].len/4096);
			Freeinfo *f=((Freeinfo*)0x2008)+(allocr->size++);
			f->addr=(int)ards[i].base/4096;
			f->size=(int)ards[i].len/4096;
		}
	}
	printf("Total %x records with %x pages free\n",allocr->size,all);
}
void* malloc(int size){
	malloc_page((size+0xfff)>>12);
}
void* malloc_page(int pages){
	for(int i=0;i<allocr->size;i++){
		Freeinfo* f=&(allocr->root[i]);
		if(f->size==pages){
			memcpy(f,f+1,(allocr->size-(f-allocr->root))*sizeof(f));
			allocr->size--;
			return (void*)(f->addr*4096);
		}
		if(f->size>pages){
			int ret=f->addr*4096;
			f->addr+=pages;
			f->size-=pages;
			return (void*)ret;
		}
	}
	return NULL;
}
void free(void* memory,int size){
	free_page(((int)memory)>>12,(size+0xfff)>>12);
}
void free_page(int mem,int pages){
	for(Freeinfo *f=allocr->root;f->size>0;f++){
		if(f->addr+f->size==mem)f->size+=pages;
		elif(f->addr-pages==mem)f->addr-=pages;
		elif(((f->addr+f->size)<mem) && (((f+1)->addr-pages)>mem)){
			memmove(f+1,f,(allocr->size-(f-allocr->root))*sizeof(f));
			allocr->size++;
		}
	}
}
Position curpos;
void putch(char c){
	if(c=='\n')curpos.x++,curpos.y=0;
	elif(c=='\r')curpos.y=0;
	elif(c=='\b'){
		if(curpos.y==0)return;
		Position pos={curpos.x,curpos.y-1};
		vramcpy(pos,curpos,80-curpos.y);
		curpos.y--;
	}
	elif(c==0x7f){
		Position pos={curpos.x,curpos.y+1};
		vramcpy(curpos,pos,79-curpos.y);
	}
	elif(c=='\t'){
		int len=(curpos.y|3)+1-curpos.y;
		for(int i=0;i<len;i++)putch(' ');
	}
	else{
		Position pos={curpos.x,curpos.y-1};
		if((kbd_flag&64))vrammove(curpos,pos,79-curpos.y);
		putchar(curpos.x,curpos.y,c,GREY);
		curpos.y++;
	}
	if(curpos.y>=80)curpos.x++,curpos.y=0;
}
int putstr(const char* str){
	while(*str){
		putch(*str);
		str++;
	}
	return True;
}
int puts(const char* str){
	putstr(str);
	putch('\n');
}
int printf(const char* format,...){
	va_list v;
	va_start(v,format);
	for(int i=0;format[i]!=0;i++){
		if(format[i]!='%'){
			putch(format[i]);
			continue;
		}
		char c=format[++i];
		if(c==0)return False;
		if(c=='x')putint(va_arg(v,int));
		elif(c=='c')putch(va_arg(v,int));
		elif(c=='s')putstr(va_arg(v,const char*));
		else return False;
	}
	va_end(v);
	return True;
}
void pause(){
	int3();
}
void int3(){
	printf("Press any key to continue...\n");
	getch();
}
Cache* stdin;
int getch(){
	return read_cache_wait(stdin);
}
int read_cache_wait(Cache* c){
	while(fifo_size(c)==0);
	return read_cache(c);
}
void write_cache_wait(Cache* c,int data){
	while(fifo_size(c)==c->len-1);
	write_cache(c,data);
}
void int0e(int cr2,int code){
	printf("#PF cr2=%x code=%x\n",cr2,code);
}
void int0d(int code){
	printf("#GP code=%x\n",code);
}
int mem_left(){
	int total=0;
	for(int i=0;i<allocr->size;i++){
		total+=allocr->root[i].size;
	}
	return total;
}
void vramcpy(Position dst,Position src,int len){
	memcpy((void*)(VRAM+dst.x*160+dst.y*2),(void*)(VRAM+src.x*160+src.y*2),len*2);
}
void vrammove(Position dst,Position src,int len){
	memmove((void*)(VRAM+dst.x*160+dst.y*2),(void*)(VRAM+src.x*160+src.y*2),len*2);
}
void *memcpy(void* dst,void* src,int size){
	char *d=dst,*s=src;
	while(size--)*(d++)=*(s++);
}
void *memmove(void* dst,void* src,int size){
	char *d=dst,*s=src;
	if(dst<src){
		while(size--)*(d++)=*(s++);
	}else{
		dst+=size;
		src+=size;
		while(size--)*(--d)=*(--s);
	}
}
