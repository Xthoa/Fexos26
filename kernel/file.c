//file.c
#include "kernel.h"
FS fs;
void init_fs(){
	char* base=(char*)0xe000;	//sector 25
	fs.filecnt=*(int*)base;
	fs.start=base+32;
} 
File* fopen(char* name){
	for(int i=0;i<fs.filecnt;i++){
		File* f=fs.start+i;
		if(strcmp(f->name,name)==0)return f;
	}
	// TODO: add kind of lock here to ensure r/w safety
	return NULL;
}
char* filepos(File* f){
	return ((char*)fs.start)+f->pos;
}
// TODO: add function 'fclose' used to free file lock
