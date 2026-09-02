;; given an array of bytes, parse to uint64 value
;; non-numeric digit prints to STDERR and exits
include './common.inc'

parse_uint64:
;; rdi: num (ascii)
;; rsi: byte_count
;; out -> rax: num (uint64)
	mov rax, 0 		; sum
	mov r8, 0		; idx
.loop_start:
	cmp r8, rsi
	jge .func_end
	cmp byte [rdi + r8], '0'
	jl .error
	cmp byte [rdi + r8], '9'
	jg .error
	imul rax, 10
	movzx r9, byte [rdi + r8]
	add rax, r9
	sub rax, '0'
	inc r8
	jmp .loop_start
.func_end:
	ret
.error:
	movzx rbx, byte [rdi + r8]
	PRINTERR .error_msg, .error_msg_len
	EXIT rbx

.error_msg db 'Failed to parse uint64 value'
.error_msg_len = $ - .error_msg
