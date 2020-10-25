bits 32
section .text
global _find_task
_find_task:
	mov eax,29
	mov edx,[esp+4]
	int 0x31
	ret
global _search_task
_search_task:
	mov eax,30
	mov edx,[esp+4]
	int 0x31
	ret
global _task_now
_task_now:
	mov eax,31
	mov edx,[esp+4]
	int 0x31
	ret
