bits 32
section .text
global _find_task
_find_task:
	push edx
	mov eax,29
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret
global _search_task
_search_task:
	push edx
	mov eax,30
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret
global _task_now
_task_now:
	push edx
	mov eax,31
	mov edx,[esp+8]
	int 0x31
	pop edx
	ret
