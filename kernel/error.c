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
	while(1)hlt();
}
