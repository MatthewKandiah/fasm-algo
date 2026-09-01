	format ELF64 executable 3

	segment readable executable
	
	;; print original values
	mov rax, 1
	mov rdi, 1
	mov rsi, orig
	mov rdx, orig_size
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, nums
	mov rdx, nums_size
	syscall

	;; sort in place
	;; rbx = j
	;; rcx = key
	;; rdx = i
	mov rbx, 1
begin:	cmp rbx, nums_size-1
	jge stop

	movzx rcx, byte [nums + rbx]
	mov rdx, rbx
	dec rdx
inner: 	cmp rdx, 0
	jl insert
	cmp byte [nums + rdx], cl
	jle insert
	mov al, byte [nums + rdx]
	mov byte [nums + rdx + 1], al
	dec rdx
	jmp inner
insert:	mov byte [nums + rdx + 1], cl
	inc rbx
	jmp begin
	
	;; print sorted values
stop:	mov rax, 1		
	mov rdi, 1
	mov rsi, sort
	mov rdx, sort_size
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, nums
	mov rdx, nums_size
	syscall

exit:	mov rax, 60
	mov rdi, 0
	syscall


	
	segment readable writable

	orig db 'original:',0xA
	orig_size = $-orig
	sort db 'sorted:',0xA
	sort_size = $-sort
    	nums file 'data.txt'
	nums_size = $-nums
