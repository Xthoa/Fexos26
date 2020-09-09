//intapi.c
#include "kernel.h"
int apideliv(int ino,int edi,int esi,int ebp,int esp,int ebx,int edx,int ecx,int eax){
	__asm__("sti");
	//while(1);
	if(ino==0x30)int30api();
	elif(ino==0x31)return int31api(eax,ebx,ecx,edx,esi);
	//elif(ino==0x32)return int32api(eax);
}
void int30api(){
	puts("Int30");
}
int int31api(int eax,int ebx,int ecx,int edx,int esi){	//basic common i/o
	Htask task=task_now();
	int ds=task->ss+8;
	Cache* c=task->c;
	Descriptor* d=GDT+(ds>>3);
	int dsbs=(((unsigned char)d->base3)<<24)+(((unsigned char)d->base2)<<16)+((unsigned short)d->base);
	if(eax==1)putch(ecx);
	elif(eax==2)putint(ecx,8);
	elif(eax==3)putdec(ecx,8);
	elif(eax==4)putint(ecx,edx);
	elif(eax==5)putdec(ecx,edx);
	elif(eax==6)putch('\n');
	elif(eax==7)putch('\r');
	//elif(eax==8)puts("Hello World!");
	elif(eax==9)return read_cache(c);
	elif(eax==10)return read_cache_wait(c);
	elif(eax==11)write_cache(c,ecx);
	elif(eax==12)write_cache_wait(c,ecx);
	elif(eax==13)putstr(dsbs+esi);
	elif(eax==14)puts(dsbs+esi);
	elif(eax==15)curpos.x=curpos.y=curpos.lim=0;
	elif(eax==16)cls_bg();
	elif(eax==17){
		cls_bg();
		curpos.x=curpos.y=curpos.lim=0;
	}/*
	elif(eax==18){
		if(ebx!=-1)curpos.x=ebx;
		if(ecx!=-1)curpos.y=ecx;
		if(edx!=-1)curpos.lim=edx;
	}*/
	elif(eax==19){
		while(ecx--){
			*(char*)(dsbs+(esi++))=read_cache_wait(c);
		}
	}
	elif(eax==20){
		while(1){
			*(char*)(dsbs+(esi))=read_cache_wait(c);
			if((*(char*)(dsbs+(esi++)))=='\n')break;
		}
	}
	elif(eax=21){
		int total=bootinfo->os_usable_pages;
		int all=0;
		for(int i=0;i<allocr->size;i++){
			Freeinfo *f=allocr->root+i;
			putdec(i,2);
			putch(32);
			putint(f->addr,8);
			putch(32);
			putint(f->size,8);
			putch(10);
			all+=f->size;
		}
		putstr("Total ");
		putdec(total/256,8);
		putstr(" M\nLeft ");
		putdec(all/256,8);
		puts(" M");
	}
	return 0;
}
/*
int int32api(int eax,int ebx,int edx){
	//system functions
	/*int ssi=task_now()->ss,csi=ssi-8,dsi=ssi+8;
	Descriptor* ds=GDT+(dsi>>3);
	Descriptor* cs=GDT+(csi>>3);
	Descriptor* ss=GDT+(ssi>>3);
	int dsbs=(((unsigned char)ds->base3)<<24)+(((unsigned char)ds->base2)<<16)+((unsigned short)ds->base);
	if(eax==1)return malloc_page(edx);
	//elif(eax==2)push_page(ebx,)
}*/
