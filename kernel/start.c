#include "kernel.h"
Bool kbd_flag;	//0 !insert ctrl alt caps !num shift e0
Allocator gdtaloc;
_Gdtr gdtr;
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
	cls_bg();
	curpos.x=curpos.y=0;
	Cache cac;
	int buf[64];
	fifo_init(&cac,buf,64);
	kbdcac=&cac;
	Cache out;
	int *buf2=0x3000;
	fifo_init(&out,buf2,4096);
	stdout=&out;
	init_allocator();
	disable_page(0,0x100);		//total 1M [0x100 Pages] for kernel
	init_idt();
	init_gdt();
	cpuids();
	init_mt();
	Htask sys=create_task_0();
	task_ready(sys);
	init_sbh();
	init_fs();
	scrx=bootinfo->scrx>>3;
	scry=bootinfo->scry>>4;
	sysfont=malloc_page(1);
	sysfont=push_page(sysfont,1);
	StaticFile* sf=fopen("rofs/system/system.font");
	char* pos=filepos(sf);
	//printf("%x\n",pos);
	memcpy(sysfont,pos,2048);
	memset(sysfont+2048,0,2048);
	fclose(sf);
	bootinfo->vram=push_page(VRAM,bootinfo->scrx*bootinfo->scry/2048);
	Htask app=create_task("Manager");
	task_init(app,manager);
	init_pit();
	enable_pic(0xff78);
	puts("Welcome to Fexos 2.2");
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
	puts("Fexos 2.2 Exiting...");
	enable_pic(0xffff);
	return;
}
void cls_bg(){
	memset((void*)VRAM,0,bootinfo->scrx*bootinfo->scry*2);
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
	exec("rofs/user/shell.fex",NULL,FATHER,WAIT,ALL,"./");
	while(1){
		//if(fifo_size(&c)>0)write_cache(search_task(2)->c,read_cache(&c));
		//hlt();
	}
}
void app_startup(char* name,char* args,Htask father,AppOption ao,char* workdir){
	Htask self=task_now();
	StaticFile* f=fopen(name);
	int* p=filepos(f);
	//printf("f6 %x %x %x %x %x %x\n",f,p,name,args,father,ao.incac);
	//printf("%x %x\n",f,p);
	int magic=*(p++);
	if(magic!=0x78656600){
		puts("File not executable (0x0000 & 0x0005)");
		write_cache(self->c,MSG_TASK_CHILDFIN);
		write_cache(self->c,self);
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
	int bss=(*(p++))/*+1*/;
	int entry=*(p++);
	
	int pdepte=malloc_page(3);
	int pde=pdepte,pte0=pdepte+4096,pte1=pdepte+8192;
	
	int *pdelin=push_page(pde,1),*pte0lin=push_page(pte0,1),*pte1lin=push_page(pte1,1);
	
	int data=malloc_page(ss+bss);
	int *datalin_krnl=push_page(data,ss+bss);
	InstanceEx* instex=(char*)datalin_krnl+PAGE_SIZE*(ss+bss-1);
	
	int *datalin=local_page(pdelin,pte1,pte1lin,data,1,0,ss+bss);
	//printf("%x %x %x %x\n",data,datalin_krnl,datalin,instex);
	
	memcpy(datalin_krnl+4,p,f->len-16);
	fclose(f);
	
	char* inst_phy=(char*)malloc_page(1);
	Instance *inst=push_page(inst_phy,1);
	local_page(pdelin,pte0,pte0lin,inst_phy,0,1,1);
	inst->cmdline_loc=instex->cmdline;
	if(args)strcpy(instex->cmdline,args);
	else instex->cmdline[0]=0;
	
	datalin_krnl[0]=0;
	datalin_krnl[1]=args?(char*)((int)instex->cmdline-(int)datalin_krnl):NULL;
	datalin_krnl[2]=inst; 
	
	inst->workdir=instex->workdir;
	strcpy(instex->workdir,workdir);
	
	//printf("%x %x %x %x %x\n",(int)app_startup_asm&0xfffff000,pdelin,pte0lin,pte1lin);
	//delay(40);
	
	local_page(pdelin,pte0,pte0lin,0x3000,0,0x3,12);
	local_page(pdelin,pte0,pte0lin,0x100000,0,0x100,7);
	
	inst->pm.pde=pde;
	inst->pm.pdelin=pdelin;
	inst->pm.pte0=pte0;
	inst->pm.pte0lin=pte0lin;
	inst->pm.pte1=pte1;
	inst->pm.pte1lin=pte1lin;
	inst->dataglob=datalin_krnl;
	
	int sc=(int)alloc(&gdtaloc,2);
	set_segmdesc(sc,0x00400000,(ss+bss)*PAGE_SIZE-1,SEG_CODE);
	set_segmdesc(sc+1,0x00400000,(ss+bss)*PAGE_SIZE-1,SEG_DATA);
	
	inst->a.cs=sc*8;
	inst->a.eip=entry+0x10;
	self->ss=inst->a.ss=(sc+1)*8;
	inst->a.esp=(ss+bss)*PAGE_SIZE-8;	//reserve space of 2 arg
	inst->cr3=pde;
	inst->self=inst;
	
	self->cr3=pde;
	app_startup_asm(inst,2);
	self->cr3=PDE;
	
	afree(&gdtaloc,sc,2);
	
	pop_page(1);
	free_page((int)inst_phy>>12,1);
	
	pop_page(ss+bss);
	free_page(data>>12,ss+bss);
	
	pop_page(3);
	free_page(pdepte>>12,3);
	
	free_page((int)self->pte>>12,1);
	write_cache(self->c,MSG_TASK_CHILDFIN);
	write_cache(self->c,self);
	task_delete(self);
	
	while(1);
} 
