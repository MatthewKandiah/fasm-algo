format ELF64 executable 3

segment readable executable
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, msg_size
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

segment readable writable
	msg db "hello world", 10
	msg_size = $-msg
