#include "fexos.h"
#define light 0x39ef
#define red 0xc000
#define green 0x600
#define blue 0x18
unsigned short f4to16u(int c){
	unsigned short ret;
	ret|=((c&1)?blue:0);
	ret|=((c&2)?green:0);
	ret|=((c&4)?red:0);
	ret|=((c&8)?light:0);
	return ret;
}
int f1to4(char c){
	if('0'<=c && c<='9')return c-'0'+0x0;
	if('a'<=c && c<='f')return c-'a'+0xa;
	if('A'<=c && c<='F')return c-'A'+0xA;
	return 0;
}
unsigned short a16tos4u(char* start){
	unsigned int c1=f1to4(start[0]);
	int c2=f1to4(start[1]);
	int c3=f1to4(start[2]);
	int c4=f1to4(start[3]);
	unsigned short ret=(c1<<12)|(c2<<8)|(c3<<4)|(c4);
	return ret;
}
int start(int argc,char** argv){
	if(*argv==0 || *argv[0]==0){
		printf("cons color=0x%x\n",get_color());
	}
	else if(strcmp(*argv,"--help")==0){
		puts("Usage: color [<color>]");
		puts("1) color  Get console color;");
		puts("2) color <bg><fg>  Set console color;");
		puts("3) color --rgb <bg><fg>  Set console color;");
	}
	else if(strncmp(*argv,"--rgb",5)==0){
		if(argv[0][5]!=' ' || argv[0][6]==0){
			puts("Usage: color --rgb <bgcol4><fgcol4>  Set console color;");
			return 0;
		}
		unsigned short bgo=a16tos4u(*argv+6);
		unsigned short fgo=a16tos4u(*argv+10);
		if(bgo==fgo){
			puts("bg and fg cant be the same color");
			return 1;
		}
		unsigned int col=(bgo<<16)|fgo;
		printf("cons color=0x%x\n",col);
		set_color(col);
	}
	else{
		char bg=(*argv)[0],fg=(*argv)[1];
		if(bg==fg){
			puts("bg and fg cant be the same color");
			return 1;
		}
		unsigned int col=(f4to16u(f1to4(bg))<<16)|(f4to16u(f1to4(fg)));
		printf("cons color=0x%x\n",col);
		set_color(col);
	}
	return 0;
}
