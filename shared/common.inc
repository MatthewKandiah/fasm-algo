	STDIN_FILENO = 0
	STDOUT_FILENO = 1
	STDERR_FILENO = 2

macro PRINT addr, size {
	mov rax, 1
	mov rdi, STDOUT_FILENO
	mov rsi, addr
	mov rdx, size
	syscall
}

macro PRINTERR addr, size {
	mov rax, 1
	mov rdi, STDERR_FILENO
	mov rsi, addr
	mov rdx, size
	syscall
}
	
macro EXIT code {
	mov rax, 60
	mov rdi, code
	syscall
}
