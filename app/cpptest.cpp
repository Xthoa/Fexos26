#include "fexos.h"
class P{
	int x;
public:
	P(){
		x=0;
	}
	P(int m){
		x=m;
	}
	int get(){
		return x;
	}
	void set(int m){
		x=m;
	}
};
extern "C" int start(int argc,char** argv){
	P p1(100);
	P p2;
	p2.set(p1.get()*2);
	P p3(p2.get()*2);
	printf("%x\n",p3.get());
	return 0;
}
