//file.c
#include "kernel.h"
FS fs;
void init_fs(){
	char* base=(char*)0xf000;	//sector 33
	fs.filecnt=*(int*)base;
	fs.start=base+32;
} 
StaticFile* fopen(char* name){
	for(int i=0;i<fs.filecnt;i++){
		StaticFile* f=fs.start+i;
		if(strcmp(f->name,name)==0){
			if((f->flag&32)==0){
				//printf("%x\n",f);
				//printf("%x\n",f->flag);
				f->flag|=32;
				//printf("%x\n",f->flag);
				return f;	//accessed lock
			}
			else return NULL;
		}
	}
	return NULL;
}
char* filepos(StaticFile* f){
	return ((char*)fs.start)+f->pos;
}
void fclose(StaticFile* f){
	f->flag&=-33;		//unlocking
}
