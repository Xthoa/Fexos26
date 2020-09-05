//win64 c++ bin2fex
#include<bits/stdc++.h>
#include<getopt.h>
using namespace std;
int main(int argc,char** argv){
	char ch;
	int data=0,bss=0,entry=0;
	string inf,outf;
	while((ch=getopt(argc,argv,"i:o:d:b:e:"))!=-1){
		switch(ch){
			case 'd':{
				if(*optarg=='-')data=atoi(optarg+2);
				else data=atoi(optarg);
				break;
			}
			case 'e':{
				if(*optarg=='-')entry=atoi(optarg+2);
				else entry=atoi(optarg);
				break;
			}
			case 'b':{
				if(*optarg=='-')bss=atoi(optarg+2);
				else bss=atoi(optarg);
				break;
			}
			case 'i':{
				inf=optarg;
				break;
			}
			case 'o':{
				outf=optarg;
				break;
			}
		}
	}
	ifstream fin(inf);
	ofstream fout(outf);
	fout.write((char*)&data,4);
	fout.write((char*)&bss,4);
	fout.write((char*)&entry,4);
	fout.close();
	system(("copy "+outf+" /B + "+inf+" /B "+outf+" /B").c_str());
	return 0;
} 
