section .text
	global _start
	
_start:
	mov rdi, 0x1
	mov rsi, _input
	mov rdx, _input_len
	mov rax, 0x1
	syscall
	xor rdi, rdi
	mov rsi, flag
	mov rdx, 0xa
	xor rax, rax
	syscall

section .rodata
	_input db 'Input: '
	_input_len equ $-_input
	success db 'Correct :)', 0xa
	success_len equ $-success

section .bss
	flag resb 0x14
