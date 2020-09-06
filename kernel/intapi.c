//intapi.c
#include "kernel.h"
int apideliv(int ino,int edi,int esi,int ebp,int esp,int ebx,int edx,int ecx,int eax){
	__asm__("sti");
	//while(1);
	if(ino==0x30)int30api();
	elif(ino==0x31)return int31api(eax,ecx,edx,esi);
}
void int30api(){
	puts("Int30 Api");
}
int int31api(int eax,int ecx,int edx,int esi){	//basic common i/o
	int ds=task_now()->ss+8;
	Cache* c=task_now()->c;
	Descriptor* d=GDT+(ds>>3);
	int dsbs=(((unsigned char)d->base3)<<24)+(((unsigned char)d->base2)<<16)+((unsigned short)d->base);
	if(eax==1)putch(ecx);
	elif(eax==2)putint(ecx,8);
	elif(eax==3)putdec(ecx,8);
	elif(eax==4)putint(ecx,edx);
	elif(eax==5)putdec(ecx,edx);
	elif(eax==6)putch('\n');
	elif(eax==7)putch('\r');
	elif(eax==8)puts("Hello World!");
	elif(eax==9)return read_cache(c);
	elif(eax==10)return read_cache_wait(c);
	elif(eax==11)write_cache(c,ecx);
	elif(eax==12)write_cache_wait(c,ecx);
	elif(eax==13)putstr(dsbs+esi);
	elif(eax==14)puts(dsbs+esi);
	elif(eax==15)curpos.x=curpos.y=0;
	elif(eax==16)cls_bg();
	elif(eax==17){
		cls_bg();
		curpos.x=curpos.y=0;
	}
	return 0;
}
