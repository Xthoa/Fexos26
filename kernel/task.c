//task.c
#include "kernel.h"
TaskTab tasktab;
void init_mt(){
	tasktab.root=malloc(sizeof(Task)*MAX_TASKS);
	memset(tasktab.root,0,sizeof(Task)*MAX_TASKS);
	tasktab.size=0;
	tasktab.now=0;
}
Htask create_task_0(){
	Htask t=tasktab.root;
	t->flag=1;
	t->tid=0;
	t->name="System";
	t->sel=16;
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
			int p=malloc_page(1);
			*(int*)(PDE+i*4)=(int)p+PDE_TAB;
			//printf("T0 %x %x %x %x\n",t,i,(int)(PDE+i*4),*(int*)(PDE+i*4));
			t->pte=p;
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
Htask search_task(int tid){
	return tasktab.ready[tid];
}
void schedule(){
	if(tasktab.size>1){
		Htask t=task_now();
		tasktab.now++;
		if(tasktab.now==tasktab.size)tasktab.now=0;
		__asm__("sti");
		Htask n=task_now();
		//printf("T7 %x %x %x\n",n,tasktab.now,n->regs);
		restart(t,n);
	}
}
