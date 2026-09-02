	format ELF64 executable 3
	entry _start

	include '../shared/common.inc'
	
	segment readable executable

_start:
	PRINT orig, orig_size
	PRINT nums, nums_size
	ARG1 nums
	ARG2 nums_size
	call do_sort
	PRINT sort, sort_size
	PRINT nums, nums_size

	PRINT orig, orig_size
	PRINT nums2, nums2_size
	ARG1 nums2
	ARG2 nums2_size
	call do_sort
	PRINT sort, sort_size
	PRINT nums2, nums2_size
	
	EXIT 0

do_sort:
	;; rdi: nums
	;; rsi: nums_size
	;; r8 = j
	;; r9 = key
	;; r10 = i
	mov r8, 1
	dec rsi
.begin:
	cmp r8, rsi
	jge .stop

	movzx r9, byte [rdi + r8]
	mov r10, r8
	dec r10
.inner:
	cmp r10, 0
	jl .insert
	cmp byte [rdi + r10], r9b
	jle .insert
	mov al, byte [rdi + r10]
	mov byte [rdi + r10 + 1], al
	dec r10
	jmp .inner
.insert:
	mov byte [rdi + r10 + 1], r9b
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
	nums2 file 'data2.txt'
	nums2_size = $-nums2
