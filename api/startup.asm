bits 32
section .entry
extern _start
global _entry
_entry:
call _start
retf