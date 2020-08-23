#include<bits/stdc++.h>
using namespace std;
ifstream rule;
string getword(){
	char c;
	rule>>c;
	string ret;
	if(c=='\'' or c=='\"'){
		char tmp;
		while(rule>>tmp,tmp!=c)ret+=tmp;
	}else{
		rule.putback(c);
		rule>>ret;
	}
	return ret;
}
int main(int argc,char**argv){
	if(argc<3)return 1;
	rule.open(argv[1]);
	char *buf=new char[1474560];
	while(!rule.eof()){
		string cmd;
		rule>>cmd;
		if(cmd=="copy"){
			string name=getword();
			int sector;
			rule>>sector;
			ifstream fin(name,ios::binary);
			fin.seekg(0,ios::end);
			int len=fin.tellg();
			cout<<name<<'\t'<<len<<endl;
			fin.seekg(0);
			fin.read(buf+512*sector,len);
		}
	}
	ofstream img(argv[2],ios::binary);
	img.write(buf,1474560);
	delete []buf;
	img.close();
	return 0;
}
