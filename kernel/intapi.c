//intapi.c
#include "kernel.h"
int apideliv(int ino,int edi,int esi,int ebp,int esp,int ebx,int edx,int ecx,int eax){
	__asm__("sti");
	//while(1);
	Instance* inst=(Instance*)ebx;
	if(ino==0x30)int30api();
	elif(ino==0x31){
		return int31api(inst,eax,ebx,ecx,edx,esi,edi);
	}
	//elif(ino==0x32)return int32api(eax);
}
void int30api(){
	puts("Int30");
}
int int31api_basic_io(Cache* c,int dsbs,int eax,int ecx,int edx,int esi){
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
	elif(eax==13)putstr((char*)(dsbs+esi));
	elif(eax==14)puts((char*)(dsbs+esi));
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
}
int int31api_file_io(Instance* inst,int dsbs,int eax,int ecx,int edx,int esi){
	if(eax==55){
		for(int i=0;i<fs.filecnt;i++){
			StaticFile* f=fs.start+i;
			printf("%2x %x %x ",f->flag,f->pos,f->len);
			puts(f->name);
		}
		printf("Total %d files\n",fs.filecnt);
	}
	elif(eax==65){
		int j;
		for(j=0;inst->workdir[j];j++);
		inst->workdir[j-1]=0;
		StaticFile* dir=fopen(inst->workdir);
		inst->workdir[j-1]='/';
		StaticFile* root=dir->pos;
		printf("%x %x\n",dir,root);
		for(int i=0;i<root->len;i++){
			StaticFile* f=root+i;
			printf("%2x %x %x ",f->flag,f->pos,f->len);
			puts(f->name);
		}
		printf("Total %d files\n",root->len);
		fclose(dir);
	}
	elif(eax==64){
		StaticFile* f=fopen(dsbs+esi);
		fclose(f);
		return f;
	}
	elif(eax==56){
		char name[64];
		char* usrn=dsbs+esi;
		if(usrn[0]=='/'){
			name[0]='.';
			strcpy(name+1,usrn);
		}else{
			strcpy(name,inst->workdir);
			strcat(name,usrn);
		}
		StaticFile* f=fopen(name);
		if(f==NULL)return NULL;
		File8* fc=dsbs+edx;
		fc->read=0;
		fc->len=fc->write=f->len;
		fc->buf=filepos(f);
		fc->flag=(((int)f)<<8)+f->flag|2;		//write forbidden
		return fc;
	}
	elif(eax==44){
		StaticFile* f=fopen(dsbs+esi);
		if(f==NULL)return NULL;
		File8* fc=dsbs+edx;
		fc->read=0;
		fc->len=fc->write=f->len;
		fc->buf=filepos(f);
		fc->flag=(((int)f)<<8)+f->flag|2;		//write forbidden
		return fc;
	}
	elif(eax==68){
		fcreate(dsbs+esi,ecx,edx);
	}
	return 0;
}
int int31api_common_io(Cache* c,int dsbs,int eax,int ecx,int edx,int esi,int edi){
	if(eax==32)return fopen(dsbs+esi);
	elif(eax==33)return filepos(edx);
	elif(eax==34)write_cache(c,MSG_TASK_CHILDFIN);
	elif(eax==35)pop_cache(c);
	elif(eax==36)return front_cache(c);
	elif(eax==37)return front_cache_wait(c);
	elif(eax==45)write_cache8(dsbs+edx,ecx);
	elif(eax==46)return read_cache8(dsbs+edx);
	elif(eax==47)return front_cache(dsbs+edx);
	elif(eax==48)pop_cache(dsbs+edx);
	elif(eax==49){
		File8* fc=dsbs+edx;
		StaticFile* f=(File*)((fc->flag&0xffffff00)>>8);
		fclose(f);
	}
	elif(eax==50)write_cache_wait(dsbs+edx,ecx);
	elif(eax==51)return read_cache_wait(dsbs+edx);
	elif(eax==52)return front_cache_wait(dsbs+edx);
	elif(eax==53){
		char* ptr=dsbs+edi;
		while(ecx--)*(ptr++)=read_cache(dsbs+edx);
	}
	elif(eax==54){
		char* ptr=dsbs+esi;
		while(ecx--)write_cache(dsbs+edx,*(ptr++));
	}
	elif(eax==66)write_cache(dsbs+edx,ecx);
	elif(eax==67)return read_cache(dsbs+edx);
	return 0;
}
int int31api_memory(Descriptor* d,int ds,int dsbs,int eax,int ecx,int edx,int esi,int edi){
	int dslim=(unsigned int)((d->atrlmt&0xf00)<<8)+(unsigned int)d->limit;
	int dsbsloc=(((unsigned char)d->base3)<<24)+(((unsigned char)d->base2)<<16)+((unsigned short)d->base);
	if(eax==21){
		int total=bootinfo->os_usable_pages;
		int all=0;
		for(int i=0;i<allocr->size;i++){
			Freeinfo *f=allocr->root+i;
			//delay(10);
			printf("%2d %x %x\n",i,f->addr,f->size);
			//delay(10);
			all+=f->size;
		}
		//delay(20);
		printf("Total %dM\nLeft  %dM\n",total>>8,all>>8);
	}
	elif(eax==22)return (int)malloc_page(edx);
	elif(eax==23)push_page((char*)edx,ecx);
	elif(eax==38)return push_page(malloc_page(edx),edx);
	elif(eax==39)return alloc(&gdtaloc,edx);
	elif(eax==40)set_segmdesc(ecx,edx,esi,edi);
	elif(eax==41)set_segmdesc(ds>>3,dsbsloc,dslim+ecx,d->atrlmt&0xf0ff);
	elif(eax==42){
		int adr=malloc_page(ecx);
		int adrlin=push_page(adr,ecx);
		set_segmdesc(ds>>3,dsbsloc,dslim+ecx,d->atrlmt&0xf0ff);
		return adrlin-dsbs;
	}
	elif(eax==43){
		int adr=(edx+dsbs)>>12;
		int size=ecx;
		set_segmdesc(ds>>3,dsbsloc,dslim-ecx,d->atrlmt&0xf0ff);
		int lin=pop_page(ecx);
		free_page(lin>>12,ecx);
	}
	return 0;
}
int int31api_exec(Instance *inst,Cache* c,int dsbs,int eax,int ecx,int edx){
	if(eax==60)return exec((char*)(dsbs+ecx),(char*)(dsbs+edx),FATHER,WAIT,ALL,inst->workdir);
	elif(eax==25){
		//printf("%x\n",edx);
		int i=0;
		while(front_cache(c)!=MSG_TASK_CHILDFIN || count_cache(c,1)!=edx)dispint((((Htask)edx)->tid)*40,30,i++,BLACK,WHITE);
		unexec();
		pop_cache(c);
		return read_cache(c);
	}
	elif(eax==26){
		while(front_cache_wait(c)!=MSG_TASK_CHILDFIN)hlt();
		unexec();
		pop_cache(c);
		return read_cache(c);
	}
	elif(eax==27){
		int ch;
		while((ch=read_cache_wait(c))){
			if(ch==MSG_TASK_CHILDFIN)break;
			write_cache_wait((search_task(edx))->c,ch);
		}
		unexec();
		pop_cache(c);
		return read_cache(c);
	}
	elif(eax==28){
		int ch;
		while(1){
			if(fifo_size(c)>0){
				if((ch=read_cache(c))!=MSG_TASK_CHILDFIN)
					write_cache_wait((search_task(edx))->c,ch);
			}
			hlt();
		}
		unexec();
		pop_cache(c);
		return read_cache(c);
	}
	elif(eax==29)return (int)find_task(edx);
	elif(eax==30)return (int)search_task(edx);
	elif(eax==31)return (int)task_now();
	elif(eax==24){
		char name[64];
		char* usrn=dsbs+ecx;
		if(usrn[0]=='/'){
			strcpy(name,usrn+1);
		}else{
			strcpy(name,inst->workdir);
			strcat(name,usrn);
		}
		//puts(name);
		//puts(dsbs+edx);
		return exec((char*)(name),(char*)(dsbs+edx),FATHER,WAIT,ALL,inst->workdir);
	}
	return 0;
}
int int31api_adv_io(int eax,int edx,int esi,int edi){
	if(eax==15)curpos.x=curpos.y=curpos.lim=0;
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
	elif(eax==69)putch(3);
	elif(eax==70)return bgcol;
	elif(eax==71)bgcol=edx;
}
int int31api(Instance* inst,int eax,int ebx,int ecx,int edx,int esi,int edi){
	int ds=inst->a.ss;
	Htask task=task_now();
	Cache* c=task->c;
	Descriptor* d=GDT+(ds>>3);
	int dsbs=inst->dataglob;
	if((0<=eax && eax<15) || eax==19 || eax==20)return int31api_basic_io(c,dsbs,eax,ecx,edx,esi);
	elif((21<=eax && eax<24) || (48<=eax && eax<44))return int31api_memory(d,ds,dsbs,eax,ecx,edx,esi,edi);
	elif(eax==55||eax==56||eax==44||(63<=eax&&eax<66)||eax==68)return int31api_file_io(inst,dsbs,eax,ecx,edx,esi);
	elif((32<=eax&&eax<38)||(44<=eax&&eax<55)||eax==66||eax==67)return int31api_common_io(c,dsbs,eax,ecx,edx,esi,edi);
	elif((24<=eax && eax<32) || eax==60)return int31api_exec(inst,c,dsbs,eax,ecx,edx);
	elif((15<=eax && eax<19) || (69<=eax && eax<72))return int31api_adv_io(eax,edx,esi,edi);
	elif(eax==57)strcpy(inst->workdir,dsbs+esi);
	elif(eax==58)strcat(inst->workdir,dsbs+esi);
	elif(eax==59){
		char* w=inst->workdir;
		int i,j=0,k=0;
		for(i=0;w[i];i++){
			if(w[i]=='/'){
				k=j;
				j=i;
			}
		}
		w[k+1]=0;
	}
	elif(eax==61){
		strcat(inst->workdir,dsbs+esi);
		strcat(inst->workdir,"/");
	}
	elif(eax==62)return (int)inst->workdir-(int)inst->dataglob;
	return 0;
}
