extern __errno_location

global ft_read

section .text

ft_read:
	; Input:
	;     rdi = file descriptor
	;     rsi = buffer
	;     rdx = number of bytes to read

	; Output:
	;     rax = number of bytes read, -1 on error

	mov rax, 0 ; read(fd: rdi, buf: rsi, count: rdx)
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
