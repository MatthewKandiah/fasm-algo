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
	
macro ARG1 value {
	mov rdi, value
}
	
macro ARG2 value {
	mov rsi, value
}
	
macro ARG3 value {
	mov rdx, value
}
	
macro ARG4 value {
	mov rcx, value
}
	
macro ARG5 value {
	mov r8, value
}
	
macro ARG6 value {
	mov r9, value
}
