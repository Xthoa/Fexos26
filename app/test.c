#include "fexos.h"
int start(int argc,char** argv){
	putchar('T');
	File f;
	open("test.txt",&f);
	int ch=getc(&f);
	printf("%2x\n",ch);
	close(&f);
	return 0;
}
