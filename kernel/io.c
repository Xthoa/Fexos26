//io.c
#include "kernel.h"
char *sysfont;
int scrx,scry;
void dispchar(int row,int col,char ch,short back,short color){
	int a=row+col;
	short* pos=(short*)(VRAM+((int)(a/scrx)*256*scrx)+((a%scrx)*16));
	char* font=sysfont+ch*16;
	for(int i=0;i<16;i++,pos+=((scrx*16)/sizeof(short))){
		char bit=font[i];
		short* ps=pos;
		for(int j=0;j<8;j++,ps+=(2/sizeof(short))){
			*ps=(bit&(1<<(7-j))?color:back);
		}
	}
}
Curpos curpos;
void oputch(char c){
	if(c=='\n' || c==KEY_PAD_ENTER){
		curpos.x=((curpos.x+scrx)/scrx)*scrx;
		curpos.y=curpos.lim=0;
		if(curpos.x==scrx*scry){
			curpos.x-=scrx;
			Position dst={0,0};
			Position src={0,scrx};
			int len=scrx*(scry-1);
			//delay(80);
			vrammove(dst,src,len);
			memset(VRAM+(scry-1)*scrx*16*16,0,scrx*16*16);
			//delay(80);
		}
	}
	elif(c=='\r')curpos.y=0;
	elif(c=='\b'){
		if(curpos.y==0)return;
		Position to={curpos.x,curpos.y-1};
		Position from={curpos.x,curpos.y};
		vramcpy(to,from,curpos.lim-curpos.y);
		dispchar(curpos.x,curpos.lim-1,32,BLACK,BLACK);
		curpos.y--;
		curpos.lim--;
	}
	elif(c==0x7f){
		if(curpos.y==curpos.lim)return;
		Position from={curpos.x,curpos.y+1};
		Position to={curpos.x,curpos.y};
		vramcpy(to,from,curpos.lim-curpos.y-1);
		curpos.y--;
		curpos.lim--;
	}
	elif(c=='\t'){
		int len=(curpos.y|3)+1-curpos.y;
		for(int i=0;i<len;i++)oputch(' ');
	}
	else{
		Position to={curpos.x,curpos.y+1};
		Position from={curpos.x,curpos.y};
		vrammove(to,from,curpos.lim-curpos.y);
		dispchar(curpos.x,curpos.y,c,BLACK,SILVER);
		curpos.y++;
		curpos.lim++;
	}
}
void putch(int c){
	write_cache_wait(stdout,c);
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
			else error(2);
		}
		elif(c=='%')putch('%');
		else error(2);
	}
	va_end(v);
	return True;
}
char transdig(int dig){
	if(dig>9)return dig+'A'-0xa;
	else return dig+'0';
}
void putint(int val,int dig){
	if(dig>8)return;
	char buf[9]={0};
	int y=dig-1;
	while(dig--){
		buf[y--]=transdig(val&0xf);
		val>>=4;
	}
	putstr(buf);
}
void putdec(int val,int dig){
	if(dig>8)return;
	char buf[9]={0};
	int y=dig-1;
	while(dig--){
		buf[y--]=transdig(val%10);
		val/=10;
	}
	putstr(buf);
}
