//std.h
#include"../app/fexos.h"
#include<stdarg.h>
int printf(const char* format,...){
	va_list v;
	va_start(v,format);
	for(int i=0;format[i]!=0;i++){
		if(format[i]!='%'){
			putchar(format[i]);
			continue;
		}
		char c=format[++i];
		if(c==0)return False;
		if(c=='x')putint(va_arg(v,int));
		elif(c=='d')putdec(va_arg(v,int));
		elif(c=='c')putchar(va_arg(v,int));
		elif(c>='0' && c<='9'){
			char d=format[++i];
			int dig=c-'0';
			if(d=='x')putintd(va_arg(v,int),dig);
			elif(d=='d')putdecd(va_arg(v,int),dig);
			else return False;
		}
		elif(c=='%')putchar('%');
		elif(c=='s'){
			putstr(/*va_arg(v,const char*)*/"abc");
		}
		else return False;
	}
	va_end(v);
	return True;
}
