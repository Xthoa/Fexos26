#include "fexos.h"
Bool runcmd(char* cmd){
	static const char* info="Fexos (26) 2.2 [Xthoa]\n\
	Compile Time: 2020-10-24 21:00\n\
	Github: https://github.com/Xthoa/Fexos26\n";
	static const char* help="Internal commands:\n\
	help\t\tDisplay this help msg\n\
	info\t\tDisplay os information\n\
	ver\t\tDisplay version info\n\
	cd\t\tChange working directory\n\
	pwd\t\tShow working directory\n\
	exit\t\tExit from shell\n";
	if(cmd[0]=='\n' || cmd[0]==0)return True;
	if(strcmp(cmd,"exit")==0)return False;
	elif(strcmp(cmd,"ver")==0)puts("Fexos 2.2");
	elif(strcmp(cmd,"info")==0)puts(info);
	elif(strcmp(cmd,"help")==0){
		puts(info);
		puts(help);
	}
	elif(strncmp(cmd,"cd",2)==0){
		if((cmd[2]==32) && (cmd[3]!=0)){
			if(strcmp(cmd+3,"..")==0)rbdir();
			else chdir(cmd+3);
		}
		else puts("Usage: cd <dir>");
	}
	elif(strcmp(cmd,"pwd")==0){
		puts(get_pwd());
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
			puts("shell: bad command");
			return True;
		}
		wait(tid);
	}
	return True;
}
int start(int argc,char** argv){
	puts("Fexos 2.1 Shell");
	while(1){
		putchar('>');
		char cmd[64]={0};
		int i=0;
		oflush();
		while(1){
			unsigned char ch=getch();
			if(ch=='\n' || ch==KEY_PAD_ENTER)break;
			if(ch>=0x80)continue;
			putchar(ch);
			if(ch=='\b' && i>0)cmd[--i]=0;
			else cmd[i++]=ch;
		}
		putcr();
		cmd[i+1]=cmd[i]=0;
		int res=runcmd(cmd);
		if(res==False)break;
	}
	return 0;
}
