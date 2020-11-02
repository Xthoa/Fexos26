#include "fexos.h"
Bool runcmd(char* cmd){
	static const char* info="Fexos (26) 2.3 [Xthoa]\n\
	Compile Time: 2020-11-2 21:30\n\
	Github: https://github.com/Xthoa/Fexos26\n";
	static const char* help="Internal commands:\n\
	help\tDisplay this help msg\n\
	info\tDisplay os information\n\
	ver\t\tDisplay version info\n\
	cd\t\tChange working directory\n\
	pwd\t\tPrint working directory\n\
	exit\tExit from shell\n";
	if(cmd[0]=='\n' || cmd[0]==0)return True;
	if(strcmp(cmd,"exit")==0)return False;
	elif(strcmp(cmd,"ver")==0)puts("Fexos 2.3");
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
		int task=exec(fname,args);
		if(task==-1){
			puts("shell: bad command");
			return True;
		}
		wait(task);
	}
	return True;
}
int start(int argc,char** argv){
	puts("Fexos 2.3 Shell v10");
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
	puts("Shell exiting...");
	return 0;
}
