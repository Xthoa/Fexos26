#include "fexos.h"
int start(int argc,char** argv){
	int *p=0;
	putchar('T');
	printf("%x %x %x\n",p,p[2],p[1]);
	printf("argc:%x argv:%x argv[0]:%x args:",argc,argv,*argv);
	putstr(*argv);
	puts(" from test.fex");
	return 0;
}
