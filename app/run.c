#include "fexos.h"
int start(int argc,char** argv){
	volatile int i=0;
	volatile int flag=0;
	char* cmd=*argv;
	//0 0 0 0 0 0 0 return
	if(cmd[0]=='-'){
		for(i=1;cmd[i];i++){
			char c=cmd[i];
			if(c==' ')break;
			if(c=='r')flag|=1;	//loop 1 - read options for this program
		}
		cmd=cmd+i+1;
	}
	for(/*options before file name goes here - the left goes to 'args'*/i=0;cmd[i];i++){
		if(cmd[i]==32){
			cmd[i]=0;
			break;	//save value of i - dont combine 2 loops
		}
	}
	char fname[24]={0},*args;
	// construct fname and args
	strcpy(fname,cmd);
	if(cmd[i+1]!=0)args=cmd+i+1;
	else args=NULL;
	int task=exec(fname,args);
	if(task==-1){
		puts("Cannot run program");
		return 1;
	}
	// wait until it dies if options want
	if((flag&1)==0)wait(task);
	return 0;
}
