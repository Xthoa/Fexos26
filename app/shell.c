#include "fexos.h"
Bool runcmd(char* cmd){
	static const char* info="Fexos (26) 1.6 [Xthoa]\n\
	Compile Time: 2020-09-16 23:06\n\
	Github: https://github.com/Xthoa/Fexos26\n";
	static const char* help="Commands:\n\
	help\t\tDisplay this help msg\n\
	info\t\tDisplay os information\n\
	ver\t\tDisplay version info\n\
	cls\t\tClear Screen\n\
	mem\t\tDisplay Memory Status\n\
	echo\t\tEcho string\n\
	exit\t\tExit from shell\n";
	//puts(cmd);
	if(strcmp(cmd,"exit")==0)return False;
	elif(strcmp(cmd,"ver")==0)puts("Fexos 1.6");
	elif(strcmp(cmd,"info")==0)puts(info);
	elif(strcmp(cmd,"help")==0){
		puts(info);
		puts(help);
	}
	elif(strcmp(cmd,"cls")==0)cls_cur();
	elif(strcmp(cmd,"mem")==0)dispmem();
	elif(strncmp(cmd,"echo",4)==0){
		if(cmd[4]==0)puts("usage: echo <string>");
		else puts(cmd+5);
	}
	else{
		if(findfile(cmd)==NULL){
			printf("shell: bad command\n");
			return True;
		}
		int tid=exec(cmd);
		wait(tid);
	}
	return True;
}
int start(){
	puts("Fexos 1.6 Shell");
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
