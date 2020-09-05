//cache.c
#include "kernel.h"
void fifo_init(Cache* c,int* buf,int len){
	c->buf=buf;
	c->read=c->write=0;
	c->len=len;
}
int fifo_size(Cache* c){
	int ret=c->write-c->read;
	if(ret<0)ret=c->len-ret;
	return ret;
}
int read_cache(Cache* c){
	if(c->write==c->read)return 0;
	int ret=c->buf[c->read];
	c->read++;
	if(c->read==c->len)c->read=0;
	return ret;
}
void write_cache(Cache* c,int data){
	if(c->write==(c->read-1))return;
	c->buf[c->write]=data;
	c->write++;
	if(c->write==c->len)c->write=0;
}
int read_cache_wait(Cache* c){
	while(fifo_size(c)==0);
	return read_cache(c);
}
void write_cache_wait(Cache* c,int data){
	while(fifo_size(c)==c->len-1);
	write_cache(c,data);
}
