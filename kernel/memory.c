//memory.c
#include "kernel.h"
Allocator* allocr;
void init_allocator(){
	int all=0;
	ARDS *ards=(ARDS*)0x510;
	allocr=(Allocator*)0x2000;
	allocr->root=0x200c; 
	allocr->size=0;
	allocr->max=398;
	for(int i=0;i<(*(short*)0x502);i++){
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
	//printf("%8x\n",all);
	bootinfo->os_usable_pages=all;
}
void* alloc(Allocator* alocr,int size){
	return (void*)((int)alloc_page(alocr,(size+0xfff)>>12));
}
void* alloc_page(Allocator* alocr,int pages){
	for(int i=0;i<alocr->size;i++){
		Freeinfo* f=&(alocr->root[i]);
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
void afree(Allocator* alocr,void* memory,int size){
	afree_page(alocr,((int)memory)>>12,(size+0xfff)>>12);
}
void afree_page(Allocator* alocr,int mem,int pages){
	for(Freeinfo *f=alocr->root;f->size>0 && f->size<=alocr->max;f++){
		if(f->addr+f->size==mem)f->size+=pages;
		elif(f->addr-pages==mem)f->addr-=pages,f->size+=pages;
		elif(((f->addr+f->size)<mem) && (((f+1)->addr-pages)>mem)){
			memmove(f+1,f,(allocr->size-(f-alocr->root))*sizeof(f));
			f->addr=mem;
			f->size=pages;
			alocr->size++;
		}
	}
}
void* malloc(int size){
	return (void*)((int)alloc(allocr,size)<<12);
}
void* malloc_page(int pages){
	void* ret=(void*)((int)alloc_page(allocr,pages)<<12);
	//dispmem();
	return ret;
}
void free(void* addr,int size){
	afree(allocr,addr,size);
}
void free_page(int mem,int pages){
	afree_page(allocr,mem,pages);
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
	for(int i=0;i<allocr->size;i++){
		Freeinfo* f=&(allocr->root[i]);
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
