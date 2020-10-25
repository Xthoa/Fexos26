#include <stdarg.h>
#pragma pack(1)
#include "funcs.h"
#include "macro.h"
#include "types.h"
#pragma once

extern Cache* kbdcac;
extern Allocator* allocr;
extern Curpos curpos;
extern Cache* stdout;
extern Bool kbd_flag;
extern Dword clock;
extern TaskTab tasktab;
extern BootInfo* bootinfo;
extern FS fs;
extern Allocator gdtaloc;
extern _Gdtr gdtr;
extern char* sysfont;
extern int scrx,scry;
extern Allocator sbh;
