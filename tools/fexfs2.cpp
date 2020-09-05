//fexfs2
#include<bits/stdc++.h>
using namespace std;
struct File{
	char flag;
	char name[23]={0};
	int len;
	int fptr;//fptr;
	char* buf;
};
struct FS{
	File* files;//fake pointer
	char* buf;
};
/*
Flag:
1	read only
2	write only
4	hidden
8	dir
16	compressed
*/
int main(int argc,char** argv){
	if(argc<3)return 1;
	ifstream fin(argv[1]);
	ofstream fout(argv[2],ios::binary);
	vector<File> files;
	File fcm;
	fcm.fptr=fcm.len=fcm.flag=0;
	while(!fin.eof()){
		string cmd;
		fin>>cmd;
		if(cmd=="copy"){
			fcm.flag++;
			File vf;
			fin>>vf.name;
			ifstream f(vf.name,ios::ate|ios::binary);
			vf.len=f.tellg();
			f.seekg(0);
			vf.buf=new char[vf.len];
			f.read(vf.buf,vf.len);
			f.close();
			int flag;
			fin>>flag;
			vf.flag=flag;
			files.push_back(vf);
		}else if(cmd=="newfile"){
			File f;
			fin>>f.name;
			fin>>f.flag;
			f.buf=NULL;
			files.push_back(f);
		}else if(cmd=="rename"){
			fcm.flag++;
			File vf;
			string name;
			fin>>name;
			ifstream f(name,ios::ate|ios::binary);
			vf.len=f.tellg();
			f.seekg(0);
			vf.buf=new char[vf.len];
			f.read(vf.buf,vf.len);
			f.close();
			fin>>vf.name;
			int flag;
			fin>>flag;
			vf.flag=flag;
			files.push_back(vf);
		}
	}
	fin.close();
	int len=files.size()*(sizeof(File)-8);
	int tmp;
	cout<<hex;
	fout.write((char*)&fcm,32);
	for(auto f:files){
		cout<<f.name<<endl;
		f.fptr=len=(len+0xf)&(-16);
		len+=f.len;
		fout.write((char*)&f,32);
	}
	char empty[16]={0};
	for(auto f:files){
		fout.write(f.buf,f.len);
		fout.write(empty,16-f.len&15);
	}
	fout.close();
	return 0;
}
