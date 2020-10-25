//memory.c
#include "kernel.h"
Allocator* allocr;//physical allocation
Allocator sbh;//physical allocation
void init_allocator(){
	int all=0,i;
	ARDS *ards=(ARDS*)0x510;
	allocr=(Allocator*)0x2000;
	memset(0x2000,0,0x1000);
	allocr->root=0x200c; 
	allocr->size=0;
	allocr->max=398;
	//Freeinfo* f=((Freeinfo*)0x200c);
	//f->addr=f->size=0;
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
	//f=((Freeinfo*)0x200c)+(allocr->size++);
	//f->addr=0xffffffff;
	//f->size=1;
	//printf("%8x\n",all);
	bootinfo->os_usable_pages=all;
}
void init_sbh(){
	sbh.root=malloc_page(4);
	Freeinfo* f=sbh.root;
	f->addr=push_page(malloc_page(4),4);
	f->size=PAGE_SIZE*4;
	sbh.max=PAGE_SIZE*4/sizeof(Freeinfo);
	sbh.size=1;
}
void* alloc(Allocator* alocr,int pages){
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
void sbh_resize(){
	afree(&sbh,push_task_page(find_task(0),malloc_page(4),4),4*PAGE_SIZE);
}
void* sbh_alloc(int size){
	void* ret;
	while((ret=alloc(&sbh,size))==NULL){
		sbh_resize();
	}
	return ret;
}
void sbh_free(int addr,int size){
	afree(&sbh,addr,size);
}
void afree(Allocator* alocr,int mem,int pages){
	int n=0,len;
	for(int i=0;i<alocr->size;i++){
		Freeinfo* f=&(alocr->root[i]);
		if(f->addr>=mem+pages){
			len=alocr->size-i;
			memmove(f+1,f,len*sizeof(Freeinfo));
			f->addr=mem;
			f->size=pages;
			n=i;
			alocr->size++;
			break;
		}
	}
	Freeinfo* front=&(alocr->root[n-1]);
	Freeinfo* self=&(alocr->root[n]);
	Freeinfo* end=&(alocr->root[n+1]);
	int raf,rae;
	raf=front->addr+front->size==mem;
	rae=end->addr==mem+pages;
	if(n==0)raf=False;
	elif(n==alocr->size-1)rae=False;
	//printf("%x %x %x %x %x %x %x %x\n",front,self,end,alocr->size,raf,rae,mem,pages);
	//delay(25);
	if(raf){
		if(rae)goto rfe;
		else goto rf;
	}
	else{
		if(rae)goto re;
		else return;
	}
	return;
	rf:
		front->size+=pages;
		len=alocr->size-n-1;
		memmove(self,end,len*sizeof(Freeinfo));
		alocr->size--;
		return;
	re:
		self->size+=end->size;
		len=alocr->size-n-2;
		memmove(end,end+1,len*sizeof(Freeinfo));
		alocr->size--;
		return;
	rfe:
		front->size+=(pages+end->size);
		len=alocr->size-2;
		memmove(self,end+1,len*sizeof(Freeinfo));
		alocr->size-=2;
		return;
}
void* malloc(int size){
	return (void*)(malloc_page((size+0xfff)>>12));
}
void* malloc_page(int pages){
	return (void*)((int)alloc(allocr,pages)<<12);
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
	memcpy((void*)(VRAM+((int)((dst.x+dst.y)/scrx)*256*scrx)+(((dst.x+dst.y)%scrx)*16)),(void*)(VRAM+((int)((src.x+src.y)/scrx)*256*scrx)+(((src.x+src.y)%scrx)*16)),len<<9-1);
}
void vrammove(Position dst,Position src,int len){
	memmove((void*)(VRAM+((int)((dst.x+dst.y)/scrx)*256*scrx)+(((dst.x+dst.y)%scrx)*16)),(void*)(VRAM+((int)((src.x+src.y)/scrx)*256*scrx)+(((src.x+src.y)%scrx)*16)),len<<9-1);
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
char *strcat(char* d,char* s){
	while(*d!=0)d++;
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
