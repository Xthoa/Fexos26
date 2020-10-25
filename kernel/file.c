//file.c
#include "kernel.h"
FS fs;
void init_fs(){
	char* base=(char*)0x12000;	//sector 33
	StaticFile *root=sbh_alloc(sizeof(StaticFile)*3);
	StaticFile *rofs=root+1,*rtfs=root+2;
	strcpy(root->name,".");
	root->len=3;
	root->flag=8;
	root->pos=root;
	strcpy(rofs->name,"rofs");
	rofs->len=0;
	rofs->flag=8;
	rofs->pos=base;
	strcpy(rtfs->name,"rtfs");
	rtfs->len=0;
	rtfs->flag=8;
	rtfs->pos=sbh_alloc(sizeof(StaticFile)*16);
	StaticFile *rtm=rtfs->pos,*rtd=rtm+1;
	strcpy(rtm->name,".");
	rtm->len=2;
	rtm->flag=8;
	rtm->pos=rtm;
	strcpy(rtd->name,"..");
	rtd->len=0;
	rtd->flag=8;
	rtd->pos=root;
	fs.filecnt=3;
	fs.start=root;
} 
StaticFile* fnew(StaticFile* root,char* name,int flag,int len,char* pos){
	StaticFile* last=root+(root->len++);
	last->flag=flag;
	last->len=len;
	last->pos=pos;
	strcpy(last->name,name);
	return last;
}
StaticFile* ffind(StaticFile* root,char* name){
	for(int i=0;i<root->len;i++){
		StaticFile* f=root+i;
		if(strcmp(f->name,name)==0){
			return f;
		}
	}
	return NULL;
}
StaticFile* fcreate(char* name,int flag,int len){
	int i=0,j=0;
	puts(name);
	StaticFile* root=fs.start;
	for(i=0;name[i];i++){
		if(name[i]=='/'){
			name[i]=0;
			root=ffind(root,name+j);
			if(root==NULL)return NULL;
			name[i]='/';
			root=root->pos;
			j=i+1;
		}
	}
	puts(name+j);
	int pos=sbh_alloc(len);
	printf("%x\n",pos);
	root=fnew(root,name+j,flag,len,pos);
	return root;
}
StaticFile* fopen(char* name){
	int i=0,j=0;
	StaticFile* root=fs.start;
	for(i=0;name[i];i++){
		if(name[i]=='/'){
			name[i]=0;
			root=ffind(root,name+j);
			if(root==NULL)return NULL;
			name[i]='/';
			//printf("%x %x\n",i,root);
			root=root->pos;
			j=i+1;
		}
	}
	root=ffind(root,name+j);
	root->flag|=32;
	//printf("%x %x %x\n",i,j,root);
	return root;
}
char* filepos(StaticFile* f){
	return f->pos;
}
void fclose(StaticFile* f){
	f->flag&=-33;		//unlocking
}
