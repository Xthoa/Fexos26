//intapi.c
#include "kernel.h"
int apideliv(int ino,int edi,int esi,int ebp,int esp,int ebx,int edx,int ecx,int eax){
	__asm__("sti");
	if(ino==0x30)int30api();
	elif(ino==0x31){
		return int31api(eax,ebx,ecx,edx,esi,edi);
	}
	//elif(ino==0x32)return int32api(eax);
}
void int30api(){
	puts("Int30");
}
int int31api(int eax,int ebx,int ecx,int edx,int esi,int edi){	//basic common i/o
	Htask task=task_now();
	int ds=((App*)ebx)->ss;
	Cache* c=task->c;
	Descriptor* d=GDT+(ds>>3);
	int dsbs=(((unsigned char)d->base3)<<24)+(((unsigned char)d->base2)<<16)+((unsigned short)d->base);
	int dslim=(unsigned int)((d->atrlmt&0xf00)<<8)+(unsigned int)d->limit;
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
	elif(eax==15)curpos.x=curpos.y=curpos.lim=0;
	elif(eax==16)cls_bg();
	elif(eax==17){
		cls_bg();
		curpos.x=curpos.y=curpos.lim=0;
	}
	elif(eax==18){
		if(edx!=-1)curpos.x=edx;
		if(esi!=-1)curpos.y=esi;
		if(edi!=-1)curpos.lim=edi;
	}
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
	elif(eax==21){
		int total=bootinfo->os_usable_pages;
		int all=0;
		for(int i=0;i<allocr->size;i++){
			Freeinfo *f=allocr->root+i;
			printf("%2d %x %x\n",i,f->addr,f->size);
			all+=f->size;
		}
		printf("Total %dM\nLeft  %dM\n",total>>8,all>>8);
	}
	elif(eax==22)return malloc_page(edx);
	elif(eax==23)push_page(edx,ecx);
	elif(eax==24){
		return exec(dsbs+ecx,dsbs+edx,FATHER,WAIT,ALL);
	}
	elif(eax==25){
		while(front_cache_wait(c)!=280);
		unexec();
		pop_cache(c);
	}
	elif(eax==26){
		while(front_cache_wait(c)!=280)hlt();
		unexec();
		pop_cache(c);
	}
	elif(eax==27){
		int ch;
		while((ch=read_cache_wait(c))){
			if(ch==280)break;
			write_cache_wait((search_task(edx))->c,ch);
		}
		unexec();
		pop_cache(c);
	}
	elif(eax==28){
		int ch;
		while(1){
			if(fifo_size(c)>0){
				if((ch=read_cache(c))!=280)
					write_cache_wait((search_task(edx))->c,ch);
			}
			hlt();
		}
		unexec();
		pop_cache(c);
	}
	elif(eax==29)return (int)find_task(edx);
	elif(eax==30)return (int)search_task(edx);
	elif(eax==31)return task_now();
	elif(eax==32)return fopen(dsbs+esi);
	elif(eax==33)return filepos(edx);
	elif(eax==34)write_cache(c,280);
	elif(eax==35)pop_cache(c);
	elif(eax==36)return front_cache(c);
	elif(eax==37)return front_cache_wait(c);
	elif(eax==38)return push_page(malloc_page(edx),edx);
	elif(eax==39)return alloc(&gdtaloc,edx);
	elif(eax==40)set_segmdesc(ecx,edx,esi,edi);
	elif(eax==41)set_segmdesc(ds>>3,dsbs,dslim+ecx,d->atrlmt&0xf0ff);
	elif(eax==42){
		int adr=malloc_page(ecx);
		int adrlin=push_page(adr,ecx);
		set_segmdesc(ds>>3,dsbs,dslim+ecx,d->atrlmt&0xf0ff);
		return adrlin-dsbs;
	}
	elif(eax==43){
		int adr=(edx+dsbs)>>12;
		int size=ecx;
		set_segmdesc(ds>>3,dsbs,dslim-ecx,d->atrlmt&0xf0ff);
		int lin=pop_page(ecx);
		free_page(lin>>12,ecx);
	}
	elif(eax==44){
		StaticFile* f=fopen(dsbs+esi);
		if(f==NULL)return NULL;
		File* fc=dsbs+edx;
		fc->read=0;
		fc->len=fc->write=f->len;
		fc->buf=filepos(f);
		fc->flag=(((int)f)<<16)+f->flag|2;		//write forbidden
		return fc;
	}
	elif(eax==45)write_cache(dsbs+edx,ecx);
	elif(eax==46)return read_cache(dsbs+edx);
	elif(eax==47)return front_cache(dsbs+edx);
	elif(eax==48)pop_cache(dsbs+edx);
	elif(eax==49){
		File* fc=dsbs+edx;
		StaticFile* f=(File*)((fc->flag&0xffff0000)>>16);
		fclose(f);
	}
	elif(eax==50)write_cache_wait(dsbs+edx,ecx);
	elif(eax==51)return read_cache_wait(dsbs+edx);
	elif(eax==52)return front_cache_wait(dsbs+edx);
	return 0;
}
