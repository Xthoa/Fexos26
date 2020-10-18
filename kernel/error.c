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
	putstr("Segment Fault ");
	printf("code=%x pc=%x_%x (Core Dumped)\n",code,cs,eip);
	//while(1)hlt();
}
