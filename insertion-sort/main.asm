	format ELF64 executable 3

	include '../shared/common.inc'
	
	segment readable executable
	
	PRINT orig, orig_size
	PRINT nums, nums_size

	call do_sort
		
	PRINT sort, sort_size
	PRINT nums, nums_size

	EXIT 0

;; TODO use caller-saved registers
do_sort:
	;; sort in place
	;; rbx = j
	;; rcx = key
	;; rdx = i
	mov rbx, 1
.begin:
	cmp rbx, nums_size-1
	jge .stop

	movzx rcx, byte [nums + rbx]
	mov rdx, rbx
	dec rdx
.inner:
	cmp rdx, 0
	jl .insert
	cmp byte [nums + rdx], cl
	jle .insert
	mov al, byte [nums + rdx]
	mov byte [nums + rdx + 1], al
	dec rdx
	jmp .inner
.insert:
	mov byte [nums + rdx + 1], cl
	inc rbx
	jmp .begin
.stop:
	ret
	
	segment readable writable

	orig db 'original:',0xA
	orig_size = $-orig
	sort db 'sorted:',0xA
	sort_size = $-sort
    	nums file 'data.txt'
	nums_size = $-nums
