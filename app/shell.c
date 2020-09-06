#include "fexos.h"
Bool runcmd(char* cmd){
	static const char* info="Fexos (26) 1.4 [Xthoa]\n\
	Compile Time: 2020-09-06 17:56\n\
	Github: https://github.com/Xthoa/Fexos26\n";
	static const char* help="Commands:\n\
	help\t\tDisplay this help msg\n\
	info\t\tDisplay os information\n\
	ver\t\tDisplay version info\n\
	cls\t\tClear Screen\n\
	exit\t\tExit from bash\n";
	//puts(cmd);
	if(strcmp(cmd,"exit")==0)return False;
	elif(strcmp(cmd,"ver")==0)puts("Fexos 1.4");
	elif(strcmp(cmd,"info")==0)puts(info);
	elif(strcmp(cmd,"help")==0){
		puts(info);
		puts(help);
	}
	elif(strcmp(cmd,"cls")==0)cls_cur();
	else printf("Error : bad command\n");
	return True;
}
int start(){
	while(1){
		putchar('>');
		char cmd[64]={0};
		int i=0;
		while(1){
			char ch=getch();
			if(ch<0)continue;
			putchar(ch);
			if(ch=='\n')break;
			if(ch=='\b')cmd[--i]=0;
			else cmd[i++]=ch;
		}
		cmd[i]=0;
		int res=runcmd(cmd);
		if(res==False)break;
	}
	return 0;
}