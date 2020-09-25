#include "fexos.h"
void raz(char* cmd,char* fname,char* args){
	for(int i=0;cmd[i];i++){
		if(cmd[i]==20){
			memcpy(fname,cmd,i);
			args=cmd+i+1;
			break;
		}
	}
}
Bool runcmd(char* cmd){
	static const char* info="Fexos (26) 1.8 [Xthoa]\n\
	Compile Time: 2020-09-25 21:45\n\
	Github: https://github.com/Xthoa/Fexos26\n";
	static const char* help="Internal commands:\n\
	help\t\tDisplay this help msg\n\
	info\t\tDisplay os information\n\
	ver\t\tDisplay version info\n\
	exit\t\tExit from shell\n";
	if(cmd[0]=='\n' || cmd[0]==0)return True;
	if(strcmp(cmd,"exit")==0)return False;
	elif(strcmp(cmd,"ver")==0)printf("Fexos 1.8");
	elif(strcmp(cmd,"info")==0)puts(info);
	elif(strcmp(cmd,"help")==0){
		puts(info);
		puts(help);
	}
	else{
		int i;
		for(i=0;cmd[i];i++){
			if(cmd[i]==32){
				cmd[i]=0;
				break;
			}
		}
		char fname[24]={0},*args;
		strcpy(fname,cmd);
		if(cmd[i+1]!=0)args=cmd+i+1;
		else args=NULL;
		int tid=exec(fname,args);
		if(tid==-1){
			printf("shell: bad command\n");
			return True;
		}
		wait(tid);
	}
	return True;
}
int start(int argc,char* argv){
	puts("Fexos 1.7 Shell");
	while(1){
		putchar('>');
		char cmd[64]={0};
		int i=0;
		while(1){
			unsigned char ch=getch();
			if(ch=='\n' || ch==KEY_PAD_ENTER)break;
			if(ch>=0x80)continue;
			putchar(ch);
			if(ch=='\b')cmd[--i]=0;
			else cmd[i++]=ch;
		}
		putcr();
		cmd[i]=0;
		int res=runcmd(cmd);
		if(res==False)break;
	}
	return 0;
}
