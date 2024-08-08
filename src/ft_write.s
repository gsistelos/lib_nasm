; ssize_t ft_write(int fd, const void *buf, size_t count);

extern __errno_location

global ft_write

section .text

ft_write:
	; Input:
	;     rdi = file descriptor
	;     rsi = buffer
	;     rdx = number of bytes to write
	;
	; Output:
	;     rax = number of bytes written, -1 on error

	mov rax, 1 ; write(fd: rdi, buf: rsi, count: rdx)
	syscall

	test rax, rax
	js   .error

	ret

.error:
	neg rax
	mov rbx, rax

	call __errno_location
	mov  [rax], rbx

	mov rax, -1
	ret
