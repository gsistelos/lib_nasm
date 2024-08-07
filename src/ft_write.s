extern __errno_location

global ft_write

section .text

ft_write:
	; Input:
	;     rdi = file descriptor
	;     rsi = buffer
	;     rdx = number of bytes to write

	; Output:
	;     rax = number of bytes written, -1 on error

	mov rax, 1 ; write(fd: rdi, buf: rsi, count: rdx)
	syscall

	test rax, rax
	js   .error

	ret

.error:
	push rdi

	neg rax
	mov rdi, rax

	call __errno_location
	mov  [rax], rdi

	pop rdi

	mov rax, -1
	ret
