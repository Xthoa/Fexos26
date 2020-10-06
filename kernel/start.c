#include "kernel.h"
Bool kbd_flag;	//0 !insert ctrl alt caps !num shift e0
Allocator gdtaloc;
_Gdtr gdtr;
void init_idt(){
	set_gatedesc(0x00,(int)interr00	,16,0,GATE_INT);
	set_gatedesc(0x01,(int)interr01	,16,0,GATE_INT);
	set_gatedesc(0x03,(int)interr03	,16,0,GATE_INT);
	set_gatedesc(0x04,(int)interr04	,16,0,GATE_INT);
	set_gatedesc(0x05,(int)interr05	,16,0,GATE_INT);
	set_gatedesc(0x06,(int)interr06	,16,0,GATE_INT);
	set_gatedesc(0x07,(int)interr07	,16,0,GATE_INT);
	set_gatedesc(0x08,(int)interr08	,16,0,GATE_INT);
	set_gatedesc(0x0a,(int)interr0a	,16,0,GATE_INT);
	set_gatedesc(0x0b,(int)interr0b	,16,0,GATE_INT);
	set_gatedesc(0x0c,(int)interr0c	,16,0,GATE_INT);
	set_gatedesc(0x0d,(int)int0d_asm,16,0,GATE_INT);
	set_gatedesc(0x0e,(int)int0e_asm,16,0,GATE_INT);
	set_gatedesc(0x10,(int)interr10	,16,0,GATE_INT);
	set_gatedesc(0x11,(int)interr11	,16,0,GATE_INT);
	set_gatedesc(0x12,(int)interr12	,16,0,GATE_INT);
	set_gatedesc(0x13,(int)interr13	,16,0,GATE_INT);
	set_gatedesc(0x20,(int)int20_asm,16,0,GATE_INT);
	set_gatedesc(0x21,(int)int21_asm,16,0,GATE_INT);
	set_gatedesc(0x30,(int)int30_asm,16,0,GATE_INT);
	set_gatedesc(0x31,(int)int31_asm,16,0,GATE_INT);
}
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
	bootinfo=(BootInfo*)0x500;
	//1.init screen
	cls_bg();
	curpos.x=curpos.y=0;
	//2.init stdin
	Cache cac;
	int buf[64];
	fifo_init(&cac,buf,64);
	kbdcac=&cac;
	Cache out;
	int buf2[256];
	fifo_init(&out,buf2,256);
	stdout=&out;
	//4.init memory
	init_allocator();
	disable_page(0,0x100);		//total 1M [0x100 Pages] for kernel
	//5.set idt
	init_idt();
	gdtr.base=0xa000;
	gdtr.len=1023;
	__asm__("lgdt %0":"=g"(gdtr));
	gdtaloc.root=malloc_page(2);
	gdtaloc.size=1;
	gdtaloc.max=128;
	Freeinfo* f=gdtaloc.root;
	f->addr=5;
	f->size=123;
	cpuids();
	init_fs();
	segcnt=5;
	init_mt();
	Htask sys=create_task_0();
	Htask app=create_task("Manager");
	task_init(app,manager);
	task_ready(sys);
	init_pit();
	enable_pic(0xff78);
	puts("Welcome to Fexos 1.9");
	task_ready(app);
	while(1){
		if(fifo_size(&cac)>0){
			unsigned char key,code=read_cache(&cac);
			if(code==0xe1){
				for(int i=0;i<3;i++)read_cache_wait(&cac);
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
				write_cache(app->c,key);
			}
		}
		while(fifo_size(stdout)>0){
			int k=read_cache(stdout);
			oputch(k);
		}
		hlt();
	}
	puts("Fexos 1.9 Exiting...");
	enable_pic(0xffff);
	return;
}
void cls_bg(){
	memset((void*)VRAM,0,80*25*2);
}
Cache* stdout;
BootInfo* bootinfo;
void cpuids(){
	int buf[17]={0};
	cpuid(0,buf);
	bootinfo->cpuid.max_func=buf[0];
	buf[4]=buf[3];
	buf[3]=buf[2];
	buf[2]=buf[4];
	memcpy(bootinfo->cpuid.vendor,buf+1,12);
	cpuid(0x80000000,buf);
	bootinfo->cpuid.max_ext_func=buf[0];
	if(bootinfo->cpuid.max_ext_func<0x80000004)return;
	cpuid(0x80000002,buf);
	cpuid(0x80000003,buf+4);
	cpuid(0x80000004,buf+8);
	memcpy(bootinfo->cpuid.name,buf,48);
	return;
}
void manager(){
	Cache c;
	int buf[16];
	fifo_init(&c,buf,16);
	task_now()->c=&c;
	exec("shell.fex",NULL,FATHER,WAIT,ALL);
	while(1){
		//if(fifo_size(&c)>0)write_cache(search_task(2)->c,read_cache(&c));
		//hlt();
	}
}
void app_startup(char* name,char* args,Htask father,AppOption ao){
	Htask self=task_now();
	StaticFile* f=fopen(name);
	int* p=filepos(f);
	//printf("f6 %x %x %x %x %x %x\n",f,p,name,args,father,ao.incac);
	int magic=*(p++);
	if(magic!=0x78656600){
		puts("File not executable (0x0000 & 0x0005)");
		write_cache(self->c,280);
		task_delete(self);
		return;
	}
	switch(ao.incac){
		case SELF:{
			Cache c;
			int buf[32];
			fifo_init(&c,buf,32);
			self->c=&c;
			break;
		}
		case FATHER:{
			self->c=father->c;
			break;
		}
		case SYS:
			error(1);
	}
	switch(ao.waits){
		case WAIT_SEND_HLT:
		case CONTINUE:
			error(4);
	}
	/*switch(ao.io){
		case KBDIN:
		case SCRNOUT:
			error(3);
	}*/
	int ss=*(p++);
	int bss=*(p++);
	int entry=*(p++);
	App a;
	int stack=malloc_page(ss+bss);
	//delay(40);
	int *stack_lin=push_page(stack,ss+bss);
	//printf("%x %x %x\n",stack,stack_lin,ss+bss);
	//delay(40);
	//printf("%x %x %x\n",ss,bss,entry);
	memcpy(stack_lin+4,p,f->len-16);
	fclose(f);
	stack_lin[0]=0;
	stack_lin[1]=f->len+4;
	stack_lin[2]=&a;
	strcpy((char*)((int)stack_lin+f->len+4),args);
	//if(args)puts(args);
	//printf("a %x %x %x %x %x %x\n",stack,stack_lin,&a,f->len+4,args,stack_lin+f->len+4);
	//puts(stack_lin+f->len+4);
	int sc=(int)alloc(&gdtaloc,2);
	//printf("g2 %x\n",sc); 
	//dispalocr(&gdtaloc);
	set_segmdesc(sc,stack_lin,f->len-13,SEG_CODE);
	set_segmdesc(sc+1,stack_lin,(ss+bss)*PAGE_SIZE-1,SEG_DATA);
	a.cs=sc*8;
	a.eip=entry+16;
	self->ss=a.ss=(sc+1)*8;
	a.esp=(ss+bss)*PAGE_SIZE-9;	//reserve space of 2 arg
	app_startup_asm(&a,2);
	//printf("%x %x %x %2x %2x\n",father,father->tid,father->c,father->c->read,father->c->write);
	afree(&gdtaloc,sc,2);
	int mem=pop_page(ss+bss);
	//printf("%x\n",mem);
	free_page(stack>>12,ss+bss);
	//dispalocr(&gdtaloc);
	free_page((int)self->pte>>12,1);
	write_cache(self->c,280);
	task_delete(self);
	//while(1);
} 
