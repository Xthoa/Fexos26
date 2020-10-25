#include<bits/stdc++.h>
using namespace std;
#define elif else if
int main(int argc,char** argv){
	if(argc<3)return 1;
	ifstream fin(argv[1]);
	char *maps=new char[16*256];
	memset(maps,0,16*256);
	ofstream fout(argv[2],ios::binary);
	int total=0x100;
	while(!fin.eof()){
		string cmd;
		fin>>cmd;
		if(cmd=="char"){
			int no;
			fin>>hex>>no;
			char bytemap[9];
			fin.getline(bytemap,9);
			char *bitmap=maps+16*no;
			for(int i=0;i<16;i++){
				char bits=0;
				fin.getline(bytemap,9);
				//cout<<bytemap+i*8<<endl;
				for(int j=0;j<8;j++){
					char byte=bytemap[j];
					bool bit;
					if(byte=='#' or byte=='@' or byte=='*')bit=true;
					else bit=false;
					bits<<=1;
					bits|=bit;
					//printf("%d %c %d ; ",j,byte,bit);
				}
				bitmap[i]=bits;
				//cout<<hex<<(int)bits<<endl;
			}
		}
		elif(cmd=="total"){
			fin>>hex>>total;
		}
		elif(cmd=="save"){
			fout.write(maps,16*256);
		}
		elif(cmd=="end" or cmd=="exit"){
			break;
		}
	}
	fout.write(maps,16*total);
	fin.close();
	fout.close();
	return 0;
}
