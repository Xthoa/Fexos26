#include "fexos.h"
int start(int argc,char** argv){
	char* cmd=*argv;
	int i;
	int flag=0;
	//0 0 0 0 0 0 0 return
	for(i=0;cmd[i];i++){
		if(cmd[i]==32 && cmd[++i]=='-'){
			char c=cmd[++i];
			if(c=='r')flag|=1;	//loop 1 - read options for this program
		}
	}
	for(/*options before file name goes here - the left goes to 'args'*/;cmd[i];i++){
		if(cmd[i]==32 && cmd[i+1]!='-'){
			cmd[i]=0;
			break;	//save value of i - dont combine 2 loops
		}
	}
	char fname[24]={0},*args;
	// construct fname and args
	strcpy(fname,cmd);
	if(cmd[i+1]!=0)args=cmd+i+1;
	else args=NULL;
	int tid=exec(fname,args);
	if(tid==-1){
		puts("Cannot run program");
		return False;
	}
	// wait until it dies if options want
	if((flag&1)==0)wait(tid);
	return True;
}
