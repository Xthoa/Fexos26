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
	if(readable(c)==0)return 0;
	if(c->write==c->read)return 0;
	int ret=c->buf[c->read];
	c->read++;
	if(c->read==c->len)c->read=0;
	return ret;
}
void write_cache(Cache* c,int data){
	if(writeable(c)==0)return;
	if(c->write==(c->read-1))return;
	c->buf[c->write]=data;
	c->write++;
	if(c->write==c->len)c->write=0;
}
char read_cache8(Cache8* c){
	if(readable8(c)==0)return 0;
	if(c->write==c->read)return 0;
	int ret=c->buf[c->read];
	c->read++;
	if(c->read==c->len)c->read=0;
	return ret;
}
void write_cache8(Cache8* c,char data){
	if(writeable8(c)==0)return;
	if(c->write==(c->read-1))return;
	c->buf[c->write]=data;
	c->write++;
	if(c->write==c->len)c->write=0;
}
int readable(Cache* c){
	return (c->flag&1)==0;
} 
int writeable(Cache* c){
	return (c->flag&2)==0;
} 
int readable8(Cache8* c){
	return (c->flag&1)==0;
} 
int writeable8(Cache8* c){
	return (c->flag&2)==0;
} 
int read_cache_wait(Cache* c){
	if(readable(c)==0)return 0;
	while(fifo_size(c)==0);
	return read_cache(c);
}
void write_cache_wait(Cache* c,int data){
	if(writeable(c)==0)return;
	while(fifo_size(c)==c->len-1);
	write_cache(c,data);
}
int front_cache(Cache* c){
	if(readable(c)==0)return 0;
	if(c->write==c->read)return 0;
	int ret=c->buf[c->read];
	return ret;
}
int front_cache_wait(Cache* c){
	if(readable(c)==0)return 0;
	while(fifo_size(c)==0);
	return front_cache(c);
}
int count_cache(Cache* c,int count){
	if(readable(c)==0)return 0;
	if(c->write==(c->read+count))return 0;
	int ret=c->buf[c->read+count];
	return ret;
}
void pop_cache(Cache* c){
	if(readable(c)==0)return;
	c->read++;
	if(c->read==c->len)c->read=0;
}
