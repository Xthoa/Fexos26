//funcs.h
#include "types.h"
#pragma once
void* memset(void* dst,int val,int size);
void int21_asm();
void hlt();
void out8(int port,int data);
int strlen(const char* str);
void int3_asm();
void int0b_asm();
void int0c_asm();
void int0e_asm();
void int00_asm();
void int0d_asm();
void cpuid(int eax,int* buf);
void int20_asm();
void restart(Htask a,Htask b);
void delay(int time);
void write_cr3(int cr3);
int strcmp(char* dst,char* src);
void app_startup_asm(Instance* a,int argc);
void destart(Htask t);

void interr00();
void interr01();
void interr03();
void interr04();
void interr05();
void interr06();
void interr07();
void interr08();
void interr0a();
void interr10();
void interr11();
void interr12();
void interr13();

void entry();
void cls_bg();
void cpuids();
void manager();

void set_gatedesc(int no,int off,int sel,int param,int attr);
void int21(int code);
void int3(); 
void int0e(int cr2,int code,int eip,int cs);
void int0d(int code,int eip,int cs);
void int20();
void enable_pic(int irq);
void init_pit();
char* push_page(char* raw,int pages);
char* pop_page(int pages);
char* global_page(char* raw,int start,int pages);
char* local_page(int* pde,int ptephy,int* pte,char* raw,int pte_n,int start,int pages);
void set_segmdesc(int no,int base,int limit,int attr);
void app_startup(char* name,char* args,Htask father,AppOption ao,char* workdir);

void dispchar(int row,int col,char ch,short back,short color);
char transdig(int dig);
int puts(const char* str);
int printf(const char* format,...);
void putint(int val,int dig);
void putdec(int val,int dig);
void putch(int c);
int putstr(const char* str);
void oputch(char c);

void init_allocator();
void* malloc(int size);
void* malloc_page(int pages);
void free(void* memory,int size);
void free_page(int mem,int pages);
int mem_left();
void vramcpy(Position dst,Position src,int len);
void vrammove(Position dst,Position src,int len);
void* memcpy(void* dst,void* src,int size);
void* memmove(void* dst,void* src,int size);
void disp_mem();
void* alloc(Allocator* alocr,int size);
void* alloc_page(Allocator* alocr,int pages);
char* strcat(char* d,char* s);
void init_sbh();

void fifo_init(Cache* c,int* buf,int len);
int fifo_size(Cache* c);
int read_cache(Cache* c);
void write_cache(Cache* c,int data);
int read_cache_wait(Cache* c);
void write_cache_wait(Cache* c,int data);

void init_mt();
Htask create_task(char* name);
void task_init(Htask task,int eip);
void task_ready(Htask task);
Htask task_now();
#define GetCurProcess task_now
void task_switch(Htask task);
void disable_page(int base,int pages);
Htask find_task(int tid);
#define search_task find_task
#define FindProcess find_task
void schedule();
int exec(char* fname,char* args,int incac,int waits,int io,char* workdir);
#define ShellExecute exec
void unexec();

int apideliv(int ino,int edi,int esi,int ebp,int esp,int ebx,int edx,int ecx,int eax);
void int30api();
int int31api(Instance* inst,int eax,int ebx,int ecx,int edx,int esi,int edi);
void int30_asm();
void int31_asm();

void error(int x);
void interrdeliv(int no,int code,int eip,int cs,int eflags);
void int0d(int code,int eip,int cs);
void int0e(int cr2,int code,int eip,int cs);
void int00(int eip,int cs);

void init_fs();
StaticFile* fopen(char* name);
char* filepos(StaticFile* f);
StaticFile* ffind(StaticFile* root,char* name);
StaticFile* fnew(StaticFile* root,char* name,int flag,int len,char* pos);
StaticFile* fcreate(char* name,int flag,int len);
void fclose(StaticFile* f);
#define CreateFile fcreate
#define OpenFile fopen
#define CloseFile fclose
#define FindFile ffind
