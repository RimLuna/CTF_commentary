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
	mov rcx, 0xa
	mov rdi, flag
	mov al, '-'
	cld
	repne scasb
	cmp rcx, 0x5
	jne _exit
	mov rcx, 4
	sub rsp, 0x14

first_check:
	mov al, BYTE [flag + rcx - 1]
	sub al, 0x30
	mov BYTE [rsp + rcx - 1], al
	loop first_check
	cmp DWORD [rsp], 0x7030301
	jne _exit

second_check:
	mov eax, DWORD [flag + 0x5]
	mov bl, BYTE [flag + 0x9]
	shl rbx, 32
	or rax, rbx
	mov rcx, 0x6462607153
	xor rax, rcx
	sub rax, 0x68
	shl rax, 0x8
	mov rdx, 0x16070207c800
	cmp rax, rdx
	jne _exit
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, success
	mov rdx, success_len
	syscall

_exit:
	mov rax, 0x3c
	xor rdi, rdi
	syscall

section .rodata
	_input db 'Input: '
	_input_len equ $-_input
	flag db 'abcdefghijklmnopqrstuvwxyz'
	success db 'Correct :)', 0xa
	success_len equ $-success

section .bss
	flag resb 0x14
