#include "fexos.h"
int start(int argc,char** argv){
	if(**argv==0){
		puts("usage: echo <string>");
		return 1;
	}
	puts(*argv);
	return 0;
}
