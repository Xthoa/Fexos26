//string.c
int strcmp(char* dst,char* src){
	for(int i=0;;i++){
		if(dst[i]!=src[i])return 1;
		if(dst[i]==0 && src[i]==0)return 0;
	}
}
int strncmp(char* dst,char* src,int max){
	for(int i=0;i<max;i++){
		if(dst[i]!=src[i])return 1;
		if(dst[i]==0 && src[i]==0)return 0;
	}
	return 1;
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
char* strcpy(char* dst,char* src){
	char *d=dst,*s=src;
	while(*s)*(d++)=*(s++);
}
