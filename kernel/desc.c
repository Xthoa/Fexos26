//desc.c
#include "kernel.h"
void set_gatedesc(int no,int off,int sel,int param,int attr){
	Gate* gt=(IDT+no);
	gt->off=off&0xffff;
	gt->off2=off>>16;
	gt->sel=sel&0xffff;
	gt->param=param;
	gt->attr=attr;
}
Cache* kbdcac;
void int21(int code){
	write_cache(kbdcac,code);
}
Dword clock;
#define qemu
#ifdef qemu
#define TASK_TIME 1
#else
#define TASK_TIME 0xff
#endif
void int20(){
	clock++;
	if((clock&TASK_TIME)==0)schedule();
} 
void enable_pic(int irq){
	out8(0x21,irq&0xff);
	out8(0xa1,(irq>>8)&0xff);
}
void init_pit(){
	out8(0x43,0x34);
	out8(0x40,0xa9);
	out8(0x40,0x04);
}
char* global_page(char* raw,int start,int pages){
	Htask task=task_now();
	for(int i=start;i<pages+start;i++){
		task->pte[i]=PTE_4K+raw+i*4096;
	}
	return task->tid*0x00400000+start*0x1000;	//pte_n = tid
}
char* pop_page(int pages){
	Htask task=task_now();
	int i;
	for(i=0;(task->pte[i])&1;i++);
	int raw=0;
	//delay(40);
	i-=pages;
	raw=(task->pte[i]&0xfffff000);
	memset(task->pte+i,0,pages*4+4);
	//printf("%x %x %x\n",i,pages,raw);
	return raw;	//pte_n = tid
}
char* push_page(char* raw,int pages){
	Htask task=task_now();
	int i;
	for(i=0;(task->pte)[i]!=0;i++);
	int start=i;
	for(;pages--;i++){
		task->pte[i]=PTE_4K+raw+(i-start)*4096;
	}
	return task->tid*0x00400000+start*0x1000;	//pte_n = tid
}
char* push_task_page(Htask task,char* raw,int pages){
	int i;
	for(i=0;(task->pte)[i]!=0;i++);
	int start=i;
	for(;pages--;i++){
		task->pte[i]=PTE_4K+raw+(i-start)*4096;
	}
	return task->tid*0x00400000+start*0x1000;	//pte_n = tid
}
char* local_page(int* pde,int ptephy,int* pte,char* raw,int pte_n,int start,int pages){
	pde[pte_n]=ptephy+PDE_TAB;
	for(int i=start;i<pages+start;i++)pte[i]=PTE_4K+raw+(i-start)*4096;
	return (int)pte_n*0x00400000+start*0x1000;
}
void set_segmdesc(int no,int base,int limit,int attr){
	if((unsigned int)limit>0xfff){
		attr|=SEG_PG4K;
		limit>>=12;
	}
	Descriptor* d=(GDT+no);
	d->limit=limit&0xffff;
	d->base=base&0xffff;
	d->base2=(base>>16)&0xff;
	d->atrlmt=((limit>>8)&0xf00)|(attr&0xf0ff);
	d->base3=(base>>24)&0xff;
}
void init_idt(){
	set_gatedesc(0x00,(int)int00_asm,16,0,GATE_INT);
	set_gatedesc(0x01,(int)interr01	,16,0,GATE_INT);
	set_gatedesc(0x03,(int)interr03	,16,0,GATE_INT);
	set_gatedesc(0x04,(int)interr04	,16,0,GATE_INT);
	set_gatedesc(0x05,(int)interr05	,16,0,GATE_INT);
	set_gatedesc(0x06,(int)interr06	,16,0,GATE_INT);
	set_gatedesc(0x07,(int)interr07	,16,0,GATE_INT);
	set_gatedesc(0x08,(int)interr08	,16,0,GATE_INT);
	set_gatedesc(0x0a,(int)interr0a	,16,0,GATE_INT);
	set_gatedesc(0x0b,(int)int0b_asm,16,0,GATE_INT);
	set_gatedesc(0x0c,(int)int0c_asm,16,0,GATE_INT);
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
void init_gdt(){
	gdtr.base=0xa000;
	gdtr.len=1023;
	__asm__("lgdt %0":"=g"(gdtr));
	gdtaloc.root=malloc_page(2);
	gdtaloc.size=1;
	gdtaloc.max=128;
	Freeinfo* f=gdtaloc.root;
	f->addr=5;
	f->size=123;
}
