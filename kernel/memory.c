//memory.c
#include "kernel.h"
Allocator* allocr;
void init_allocator(){
	int all=0,i;
	ARDS *ards=(ARDS*)0x510;
	allocr=(Allocator*)0x2000;
	allocr->root=0x200c; 
	allocr->size=1;
	allocr->max=398;
	Freeinfo* f=((Freeinfo*)0x200c);
	f->addr=f->size=0;
	for(i=0;i<(*(short*)0x502);i++){
		int tp=ards[i].type;
		//printf("%2d %6x %6x %4x\n",i,(int)ards[i].base/4096,(int)ards[i].len/4096,tp);
		if(tp==1){
			Freeinfo *f=((Freeinfo*)0x200c)+(allocr->size++);
			f->addr=(int)ards[i].base/4096;
			f->size=(int)ards[i].len/4096;
			all+=f->size;
			//printf("%6x %6x\n",f->addr,f->size);
		}
	}
	f=((Freeinfo*)0x200c)+(allocr->size++);
	f->addr=0xffffffff;
	f->size=1;
	//printf("%8x\n",all);
	bootinfo->os_usable_pages=all;
}
void* alloc(Allocator* alocr,int pages){
	//printf("r2 %x %x %x\n",alocr,pages,alocr->size);
	//delay(6);
	for(int i=0;i<alocr->size;i++){
		Freeinfo* f=&(alocr->root[i]);
		//printf("r3 %x %x %x\n",f,f->addr,f->size);
		//delay(6);
		if(f->size==pages){
			memcpy(f,f+1,(alocr->size-(f-alocr->root))*sizeof(f));
			alocr->size--;
			return (void*)(f->addr);
		}
		if(f->size>pages){
			int ret=f->addr;
			f->addr+=pages;
			f->size-=pages;
			return (void*)ret;
		}
	}
	return NULL;
}
void afree(Allocator* alocr,int mem,int pages){
	//printf("r0 %x %x %x %x\n",alocr,mem,pages,alocr->size);
	//delay(16);
	//dispmem();
	//delay(16);
	for(int i=1;i<alocr->size;i++){
		Freeinfo* f=&(alocr->root[i]);
		//printf("r1 %x %x %x %x\n",f,f->addr,f->size,alocr->size);
		//delay(16);
		int front=(f-1)->addr+(f-1)->size;
		int end=f->addr-pages;
		if(front==mem){
			if(end==mem){
				(f-1)->size+=(pages+f->size);
				int len=(alocr->size-(f-alocr->root)-1)*sizeof(Freeinfo);
				memmove(f,f+1,len);
				//printf("r1.2 %x %x %x %x %x %x\n",f+1,f,len,alocr->size,f->addr,f->size);
				alocr->size--;
			}
			elif(end>mem){
				f->size+=pages;
			}
		}
		elif(front<mem){
			if(end==mem){
				f->addr-=pages,f->size+=pages;
			}
			elif(end>mem){
				int len=(alocr->size-(f-alocr->root))*sizeof(Freeinfo);
				memmove(f+1,f,len);
				//printf("r1.1 %x %x %x %x %x %x\n",f+1,f,len,alocr->size,f->addr,f->size);
				f->addr=mem;
				f->size=pages;
				alocr->size++;
			}
		}
		//printf("%x %x %x\n",f,f->addr,f->size);
	}
	//dispmem();
	//delay(18);
	//printf("r exits\n");
}
void* malloc(int size){
	return (void*)(malloc_page((size+0xfff)>>12));
}
void* malloc_page(int pages){
	void* ret=(void*)((int)alloc(allocr,pages)<<12);
	//dispmem();
	return ret;
}
void free(void* addr,int size){
	free_page((int)(addr+0xfff)>>12,(int)(size+0xfff)>>12);
}
void free_page(int mem,int pages){
	afree(allocr,mem,pages);
}
int mem_left(){
	int total=0;
	for(int i=0;i<allocr->size;i++){
		total+=allocr->root[i].size;
	}
	return total;
}
void vramcpy(Position dst,Position src,int len){
	memcpy((void*)(VRAM+dst.x*2+dst.y*2),(void*)(VRAM+src.x*2+src.y*2),len*2);
}
void vrammove(Position dst,Position src,int len){
	memmove((void*)(VRAM+dst.x*2+dst.y*2),(void*)(VRAM+src.x*2+src.y*2),len*2);
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
		d+=size;
		s+=size;
		while(size--)*(--d)=*(--s);
	}
}
char *strcpy(char* d,char* s){
	while(*s!=0)*(d++)=*(s++);
	*(d++)=0;
}
void dispmem(){
	dispalocr(allocr);
}
void dispalocr(Allocator* alocr){
	//puts("Allocator Info:");
	//printf("%x %x %x\n",alocr,alocr->root,alocr->size);
	int all=0;
	for(int i=0;i<alocr->size;i++){
		Freeinfo *f=alocr->root+i;
		printf("%x %x\n",f->addr,f->size);
		all+=f->size;
	}
	printf("Total: %x\n",all);
}
void disable_page(int base,int pages){
	/*dispmem();
	printf("r5 %x %x %x %x\n",base,pages,allocr->size,allocr->root);
	delay(12);*/
	for(int i=1;i<allocr->size;i++){
		Freeinfo* f=&(allocr->root[i]);
		//printf("r4 %x %x %x\n",f,f->addr,f->size);
		//delay(12);
		if(f->addr==base){
			if(f->size<=pages){
				memcpy(f,f+1,(allocr->size-(f-allocr->root))*sizeof(*f));
				allocr->size--;
			}
			elif(f->size>pages){
				f->addr+=pages;
				f->size-=pages;
			}
		}elif(f->addr+f->size==base+pages){
			if(f->size<=pages){
				memcpy(f,f+1,(allocr->size-(f-allocr->root))*sizeof(*f));
				allocr->size--;
			}
			elif(f->size>pages){
				f->size-=pages;
			}
		}elif((f->addr<base) && (f->addr+f->size>base+pages)){
			memmove(f+1,f,(allocr->size-(f-allocr->root))*sizeof(*f));
			f->size=base-f->addr;
			(f+1)->addr=base+pages;
			(f+1)->size-=(pages+f->size);
			allocr->size++;
		}
	}
}
int strcmp(char* dst,char* src){
	for(int i=0;;i++){
		if(dst[i]!=src[i])return 1;
		if(dst[i]==0 && src[i]==0)return 0;
	}
}
