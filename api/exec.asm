bits 32
section .text
global _exec
_exec:
	mov eax,24
	mov ecx,[esp+4]
	mov edx,[esp+8]
	int 0x31
	ret
global _wait
_wait:
	mov eax,25
	mov edx,[esp+4]
	int 0x31
	ret
global _wait_hlt
_wait_hlt:
	mov eax,26
	mov edx,[esp+4]
	int 0x31
	ret
global _wait_send
_wait_send:
	mov eax,27
	mov edx,[esp+4]
	int 0x31
	ret
global _wait_send_hlt
_wait_send_hlt:
	mov eax,28
	mov edx,[esp+4]
	int 0x31
	ret
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
