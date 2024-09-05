; ssize_t ft_read(int fd, void *buf, size_t count);

global ft_read

extern __errno_location

ft_read:
	; Input:
	;     rdi = file descriptor
	;     rsi = buffer
	;     rdx = number of bytes to read
	;
	; Output:
	;     rax = number of bytes read, -1 on error

	mov rax, 0 ; read(fd: rdi, buf: rsi, count: rdx)
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
