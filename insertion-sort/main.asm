	format ELF64 executable 3

	include '../shared/common.inc'
	
	segment readable executable
	
	PRINT orig, orig_size
	PRINT nums, nums_size

	call do_sort
		
	PRINT sort, sort_size
	PRINT nums, nums_size

	EXIT 0

do_sort:
	;; sort in place
	;; r8 = j
	;; r9 = key
	;; r10 = i
	mov r8, 1
.begin:
	cmp r8, nums_size-1
	jge .stop

	movzx r9, byte [nums + r8]
	mov r10, r8
	dec r10
.inner:
	cmp r10, 0
	jl .insert
	cmp byte [nums + r10], r9b
	jle .insert
	mov al, byte [nums + r10]
	mov byte [nums + r10 + 1], al
	dec r10
	jmp .inner
.insert:
	mov byte [nums + r10 + 1], r9b
	inc r8
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
