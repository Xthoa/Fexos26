//fexos.h
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
int start();
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
