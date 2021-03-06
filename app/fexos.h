//fexos.h
#ifdef __cplusplus
extern "C"{
#endif
#include "macro.h"
int putchar(int c);
int putint(int c);
int putdec(int c);
int putintd(int c,int d);
int putdecd(int c,int d);
int putcr();
int putlf();
void hello_world();
void entry();
int start(int,char**);
int strcmp(char* dst,char* src);
void *memcpy(void* dst,void* src,int size);
void *memmove(void* dst,void* src,int size);
int strcpy(char* dst,char* src);
int strncmp(char* dst,char* src,int max);
int getch();
int getkey();
void putback(int k);
void write_stdin(int k);
void cls();
void clcur();
void cls_cur();
int printf(const char* format,...);
void dispmem();
Htask exec(char* name,char* args);
void* malloc_page(int size);
void* malloc_raw(int size);
char* push_malloc_page(int pages);
char* push_page(char* raw,int pages);
void wait(Htask task);
void wait_hlt();
void wait_send(int tid);
void wait_send_hlt(int tid);
Htask task_now();
Htask search_task();
Htask find_task();
int puts(const char* str);
int putstr(const char* str);
void free_page(int mem,int pages);
File* open(char* name,File* file);
void close(File* f);
char getc(File* f);
void putc(File* f,char c);
void read(File* f,char* dst,int maxlen);
void write(File* f,char* src,int maxlen);
void show_dirs();
void chdir(char* path);
char* get_pwd();
void list_dirs(StaticFile* root);
StaticFile* dir_to_file(char* dir);
void show_cur_dirs();
StaticFile* create(char* name,int flag,int len);
void rbdir();
void oflush();
int get_color();
void set_color(int color); 
#ifdef __cplusplus
}
#endif
