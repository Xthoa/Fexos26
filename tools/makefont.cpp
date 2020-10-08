#include<bits/stdc++.h>
using namespace std;
#define elif else if
int main(int argc,char** argv){
	if(argc<3)return 1;
	ifstream fin(argv[1]);
	char *maps=new char[16*256];
	memset(maps,0,16*256);
	ofstream fout(argv[2],ios::binary);
	while(!fin.eof()){
		string cmd;
		fin>>cmd;
		if(cmd=="char"){
			int no;
			fin>>hex>>no;
			char bytemap[257];
			char *bitmap=maps+16*no;
			for(int i=0;i<16;i++){
				char bits=0;
				fin.getline(bytemap+i*8,9);
				//cout<<bytemap+i*8<<endl;
				for(int j=0;j<8;j++){
					char byte=bytemap[i*8+j];
					bool bit;
					if(byte=='#' or byte=='@' or byte=='*')bit=true;
					else bit=false;
					bits<<=1;
					bits|=bit;
					//printf("%d %d %02x ; ",j,bit,bits);
				}
				bitmap[i]=bits;
				//cout<<hex<<(int)bits<<endl;
			}
		}
		elif(cmd=="save"){
			fout.write(maps,16*256);
		}
		elif(cmd=="end" or cmd=="exit"){
			break;
		}
	}
	fout.write(maps,16*256);
	fin.close();
	fout.close();
	return 0;
}
