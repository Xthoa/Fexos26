//file.c
#include "kernel.h"
FS fs;
void init_fs(){
	char* base=(char*)0xf000;	//sector 33
	fs.filecnt=*(int*)base;
	fs.start=base+32;
	//printf("%x %x %x\n",base,fs.filecnt,fs.start);
} 
File* fopen(char* name){
	for(int i=0;i<fs.filecnt;i++){
		File* f=fs.start+i;
		//printf("e %x %x %s\n",i,f,f->name);
		if(strcmp(f->name,name)==0)return f;
	}
	// TODO: add kind of lock here to ensure r/w safety
	return NULL;
}
char* filepos(File* f){
	return ((char*)fs.start)+f->pos;
}
// TODO: add function 'fclose' used to free file lock
