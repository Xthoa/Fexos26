//io.c
#include "kernel.h"
Position curpos;
void putch(char c){
	if(c=='\n')curpos.x++,curpos.y=0;
	elif(c=='\r')curpos.y=0;
	elif(c=='\b'){
		if(curpos.y==0)return;
		Position pos={curpos.x,curpos.y-1};
		vramcpy(pos,curpos,80-curpos.y);
		curpos.y--;
	}
	elif(c==0x7f){
		Position pos={curpos.x,curpos.y+1};
		vramcpy(curpos,pos,79-curpos.y);
	}
	elif(c=='\t'){
		int len=(curpos.y|3)+1-curpos.y;
		for(int i=0;i<len;i++)putch(' ');
	}
	else{
		if((kbd_flag&64)){
			Position pos={curpos.x,curpos.y+1};
			vrammove(pos,curpos,79-curpos.y);
		}
		putchar(curpos.x,curpos.y,c,GREY);
		curpos.y++;
	}
	if(curpos.y>=80)curpos.x++,curpos.y=0;
}
int putstr(const char* str){
	while(*str){
		putch(*str);
		str++;
	}
	return True;
}
int puts(const char* str){
	putstr(str);
	putch('\n');
}
int printf(const char* format,...){
	va_list v;
	va_start(v,format);
	for(int i=0;format[i]!=0;i++){
		if(format[i]!='%'){
			putch(format[i]);
			continue;
		}
		char c=format[++i];
		if(c==0)return False;
		if(c=='x')putint(va_arg(v,int),8);
		elif(c=='d')putdec(va_arg(v,int),8);
		elif(c=='c')putch(va_arg(v,int));
		elif(c=='s')putstr(va_arg(v,char*));
		elif(c>='0' && c<='9'){
			char d=format[++i];
			int dig=c-'0';
			if(d=='x')putint(va_arg(v,int),dig);
			elif(d=='d')putdec(va_arg(v,int),dig);
			else return False;
		}
		elif(c=='%')putch('%');
		else return False;
	}
	va_end(v);
	return True;
}
void putchar(int row,int col,char ch,char color){
	*(char*)(VRAM+row*160+col*2+1)=color;
	*(char*)(VRAM+row*160+col*2)=ch;
}
void dispstr(int x,int y,const char* str,char col){
	while(*str){
		char c=*str;
		if(c=='\n')x++,y=0;
		elif(c=='\r')y=0;
		elif(c=='\b')y--;
		elif(c=='\t')y=(y|3)+1;
		else putchar(x,y,*str,col);
		str++;
		y++;
		if(y==80)x++,y=0;
	}
}
void putdigit(int x,int y,unsigned int dig,char col){
	if(dig>9)putchar(x,y,dig+'A'-10,col);
	else putchar(x,y,dig+'0',col);
}
void dispint(int x,int y,int dig,int val,char col){
	y+=dig-1;
	for(;dig;dig--){
		putdigit(x,y--,(unsigned int)val&0xf,col);
		val>>=4;
	}
}
void putint(int val,int dig){
	dispint(curpos.x,curpos.y,dig,val,GREY);
	curpos.y+=dig;
}
void dispdec(int x,int y,int dig,int val,char col){
	y+=dig-1;
	for(;dig;dig--){
		putdigit(x,y--,(unsigned int)val%10,col);
		val/=10;
	}
}
void putdec(int val,int dig){
	dispdec(curpos.x,curpos.y,dig,val,GREY);
	curpos.y+=dig;
}
