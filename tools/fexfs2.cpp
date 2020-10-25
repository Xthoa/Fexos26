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
1	read locked
2	write locked
4	hidden
8	dir
16	compressed
32	accessed
64	need alloc
*/
int main(int argc,char** argv){
	if(argc<6)return 1;
	ifstream fin(argv[1]);
	ofstream fout(argv[2],ios::binary);
	int bases;
	string bstmp(argv[3]);
	stringstream(bstmp)>>dec>>bases;
	int resvs;
	string rstmp(argv[4]);
	stringstream(rstmp)>>dec>>resvs;
	int father;
	string fstmp(argv[5]);
	stringstream(fstmp)>>dec>>father;
	vector<File> files;
	cout<<hex<<bases<<";"<<dec<<resvs<<";"<<hex<<father<<dec<<endl;
	int len=resvs*(sizeof(File)-4)+bases;
	char nul=0;
	File fcm;
	fcm.name[0]='.';
	fcm.flag=8;
	fcm.fptr=bases;
	fcm.len=2;
	File fcm1;
	fcm1.name[0]='.';
	fcm1.name[1]='.';
	fcm1.flag=8;
	fcm1.fptr=father;
	fcm1.len=0;
	while(!fin.eof()){
		string cmd;
		fin>>cmd;
		if(cmd=="copy"){
			fcm.len++;
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
			vf.fptr=(len=(len+0xf)&(-16));
			len+=vf.len;
			cout<<hex<<len<<endl;
			files.push_back(vf);
		}else if(cmd=="rename"){
			fcm.len++;
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
			vf.fptr=(len=(len+0xf)&(-16));
			len+=vf.len;
			cout<<hex<<len<<endl;
			files.push_back(vf);
		}
		else if(cmd=="mkdir"){
			string dirname;
			string rulename;
			int filesc;
			fin>>dirname>>rulename>>filesc;
			File vf;
			vf.fptr=(len=(len+0xf)&(-16));
			system((string("fexfs2 ")+rulename+" tmp.bin "+to_string(vf.fptr)+" "+to_string(filesc)+" "+to_string(bases)).c_str());
			fcm.len++;
			string name="tmp.bin";
			ifstream f(name,ios::ate|ios::binary);
			vf.len=f.tellg();
			f.seekg(0);
			vf.buf=new char[vf.len];
			f.read(vf.buf,vf.len);
			f.close();
			strcpy(vf.name,dirname.c_str());
			int flag;
			fin>>flag;
			vf.flag=flag|0x8;
			len+=vf.len;
			cout<<hex<<len<<endl;
			files.push_back(vf);
		}
		else if(cmd=="alias"){
			File f=files[files.size()-1];
			fin>>f.name;
			files.push_back(f);
			fcm.len++;
		}
		else if(cmd=="touch"){
			File f;
			fin>>f.name;
			fin>>f.flag;
			f.flag|=64;
			fin>>f.len;
			fin>>f.fptr;
			fcm.len++;
			files.push_back(f);
		}
	}
	fin.close();
	int tmp;
	cout<<hex;
	fout.write((char*)&fcm,32);
	fout.write((char*)&fcm1,32);
	for(auto f:files){
		printf("%s %4x\n",f.name,f.fptr);
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
