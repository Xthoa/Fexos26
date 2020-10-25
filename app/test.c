#include "fexos.h"
int start(int argc,char** argv){
	File f;
	create("rtfs/t.txt",0,4);
	open("rtfs/t.txt",&f);
	printf("%x %x %x %x %x\n",f.flag,f.len,f.buf,f.read,f.write);
	close(&f); 
	return 0;
}
