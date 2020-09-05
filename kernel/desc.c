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
void int3(){
	printf("Press any key to continue...\n");
	while(fifo_size(kbdcac)==0);
}
void int0e(int cr2,int code,int eip){
	printf("#PF cr2=%x code=%x eip=%x\n",cr2,code,eip);
}
void int0d(int code){
	printf("#GP code=%x\n",code);
}
Dword clock;
// #define qemu
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
char* push_page(char* raw,int start,int pages){
	Htask task=task_now();
	//printf("T11 %x %x\n",task,task->pte);
	for(int i=start;i<pages+start;i++){
		task->pte[i]=PTE_4K+raw+i*4096;
	}
	//printf("T12 %2x %2x %x\n",start,pages,raw);
	int ret=task->tid*0x00400000+start*0x1000;
	//printf("T13 %x\n",ret);
	return ret;	//pte_n = tid
}
char* local_page(int* pde,int* pte,char* raw,int pte_n,int start,int pages){
	pde[pte_n]=pte+PDE_TAB;
	for(int i=start;i<pages+start;i++)pte[i]=PTE_4K+raw+i*4096;
	return (int)pte_n*0x00400000+start*0x1000;
}
void set_segmdesc(int no,int base,int limit,int attr){
	if((unsigned int)limit>0xfff){
		attr|=SEG_PG4K;
		limit>>=12;
	}
	Descriptor* d=(GDT+no);
	//printf("T8 %x %x %x %x\n",d,base,limit,attr);
	d->limit=limit&0xffff;
	d->base=base&0xffff;
	d->base2=(base>>16)&0xff;
	d->atrlmt=((limit>>8)&0xf00)|(attr&0xf0ff);
	d->base3=(base>>24)&0xff;
}
int segcnt;
