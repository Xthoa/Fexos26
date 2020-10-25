//task.c
#include "kernel.h"
TaskTab tasktab;
void init_mt(){
	tasktab.root=malloc(sizeof(Task)*MAX_TASKS);
	memset(tasktab.root,0,sizeof(Task)*MAX_TASKS);
	tasktab.ready=malloc(sizeof(Htask)*MAX_TASKS);
	memset(tasktab.ready,0,sizeof(Htask)*MAX_TASKS);
	tasktab.size=0;
	tasktab.now=0;
}
Htask create_task_0(){
	Htask t=tasktab.root;
	t->flag=1;
	t->tid=0;
	t->name="System";
	t->sel=16;
	t->pte=PTE;
	t->cr3=PDE;
	return t;
}
Htask create_task(char* name){
	for(int i=0;i<MAX_TASKS;i++){
		Htask t=tasktab.root+i;
		if(t->flag==0){
			t->flag=1;
			t->tid=i;
			t->name=name;
			t->sel=16;
			int phy=malloc_page(1);
			*(int*)(PDE+i*4)=(int)phy+PDE_TAB;
			int lin=push_page(phy,1);
			memset(lin,0,4096);
			//printf("T0 %x %x %x %x\n",t,i,(int)(PDE+i*4),*(int*)(PDE+i*4));
			t->pte=lin;
			t->cr3=PDE;
			return t;
		}
	}
	return NULL;
}
void task_init(Htask task,int eip){
	//printf("T1 %x %x\n",task,eip);
	int esp=malloc_page(16)+16*PAGE_SIZE;
	task_init_ns(task,eip,16,8,8,esp,read_eflags());
}
void task_init_ns(Htask task,int eip,int cs,int ds,int ss,int esp,int eflags){	//no stack
	//printf("T2 %x %4x %4x %x\n",task,cs,ss,esp);
	task->regs=esp-sizeof(REGS);
	task->regs->esp=esp-sizeof(REGS);
	task->regs->cs=cs;
	task->regs->es=task->regs->gs=task->regs->fs=task->regs->ds=ds;
	task->regs->eip=eip;
	task->regs->eflags=eflags;
	task->ss=ss;
}
void task_ready(Htask task){
	if(task->flag==2)return;
	task->flag=2;
	tasktab.ready[tasktab.size]=task;
	tasktab.size++;
}
Htask task_now(){
	return tasktab.ready[tasktab.now];
}
Htask find_task(int tid){
	return tasktab.root+tid;
}
void schedule(){
	if(tasktab.size>1){
		Htask t=task_now();
		tasktab.now++;
		if(tasktab.now==tasktab.size)tasktab.now=0;
		__asm__("sti");
		Htask n=task_now();
		//printf("T7 %x %x %x\n",n,tasktab.now,n->regs);
		//putstr("T7 ; ");
		restart(t,n);
	}
}
void task_sleep(Htask task){
	if(task->flag!=2)return;
	__asm__("cli");
	task->flag=1;
	for(int i=0;i<tasktab.size;i++){
		if(tasktab.ready[i]==task){
			tasktab.size--;
			int j=i;
			while(tasktab.ready[j]!=0)
				tasktab.ready[j]=tasktab.ready[++j];
			if(tasktab.now>i)
				tasktab.now--;
			elif(tasktab.now==i)
				schedule();
		}
	}
}
void task_delete(Htask task){
	if(task->flag!=2)return;
	__asm__("cli");
	task->flag=0;
	for(int i=0;i<tasktab.size;i++){
		//printf("T24 %x %x %x\n",i,tasktab.size,tasktab.ready[i]);
		if(tasktab.ready[i]==task){
			tasktab.size--;
			int j=i;
			//printf("T25 %x %x %x\n",task,j,tasktab.now);
			while(tasktab.ready[j]!=0){
				//printf("T26 %x %x %x\n",j,tasktab.ready[j],tasktab.ready[j+1]);
				tasktab.ready[j]=tasktab.ready[++j];
			}
			if(tasktab.now>i){
				tasktab.now--;
				//printf("T27 %x %x\n",tasktab.now,i);
			}
			elif(tasktab.now==i){
				//printf("T28 %x %x\n",tasktab.now,i);
				if(tasktab.size>1){
					if(tasktab.now==tasktab.size)tasktab.now=0;
					__asm__("sti");
					Htask n=task_now();
					//printf("T37 %x %x %x\n",n,tasktab.now,n->regs);
					//putstr("T37 ; ");
					destart(n);
				}
			}
		}
	}
}
int exec(char* fname,char* args,int incac,int waits,int io,char* workdir){
	int i;
	Htask t;
	int stack,stack_lin,esp;
	StaticFile* f;
	if((f=fopen(fname))==NULL){
		strcat(fname,".fex");
		if((f=fopen(fname))==NULL)
			return -1;
	}
	//printf("%x\n",f);
	fclose(f);
	t=create_task(fname);
	stack=malloc_page(4);
	stack_lin=push_page(stack,4);
	esp=stack_lin+4*PAGE_SIZE-32;
	task_init_ns(t,(int)app_startup,16,8,8,esp,read_eflags());
	*(char**)(esp+4)=fname;
	*(char**)(esp+8)=args;
	*(Htask*)(esp+12)=task_now();
	AppOption ao={incac,waits,io};
	*(AppOption*)(esp+16)=ao;
	*(char**)(esp+28)=workdir;
	task_ready(t);
	return t->tid;
}
void unexec(){
	free_page((int)pop_page(4)>>12,4);
}
