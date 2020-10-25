#include "kernel.h"
void error(int x){
	static const char* err[]={
		"Error Test",
		"app_startup: ao(AppOption).incac(Incac): invalid type",
		"printf: invalid format",
		"app_startup: ao(AppOption).io(Io): invalid type",
		"app_startup: ao(AppOption).waits(Waits): invalid type"
	};
	printf("Error 0x%x: %s\n",x,err[x]);
	//while(1)hlt();
}
void interrdeliv(int no,int code,int eip,int cs,int eflags){
	printf("Int 0x%2x (0x%x) %x %x_%x",no,code,eflags,cs,eip);
	//while(1)hlt();
}
void int0e(int cr2,int code,int eip,int cs){
	putstr("Page Fault ");
	printf("code=%x cr2=%x pc=%x_%x (Core Dumped)\n",code,cr2,cs,eip);
	//while(1)hlt();
}
void int0d(int code,int eip,int cs){
	putstr("General Protection ");
	printf("code=%x pc=%x_%x (Core Dumped)\n",code,cs,eip);
	//while(1)hlt();
}
void int0c(int code,int eip,int cs,int esp,short ss){
	putstr("Stack Fault ");
	printf("code=%x pc=%x_%x stack=%x_%x (Core Dumped)\n",code,cs,eip,ss,esp);
	//while(1)hlt();
}
void int0b(int code,int eip,int cs){
	putstr("Segment Not present ");
	printf("code=%x pc=%x_%x (Core Dumped)\n",code,cs,eip);
	//while(1)hlt();
}
void int00(int eip,int cs){
	putstr("Zero Division ");
	printf("pc=%x_%x (Core Dumped)\n",cs,eip);
	//while(1)hlt();
}
