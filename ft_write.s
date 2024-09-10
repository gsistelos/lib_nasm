; ssize_t ft_write(int fd, const void *buf, size_t count);

global ft_write

extern __errno_location

ft_write:
	; Input:
	;     rdi = fd -> file descriptor
	;     rsi = buf -> buffer
	;     rdx = count -> number of bytes to write
	;
	; Output:
	;     rax = number of bytes written, -1 on error

	mov rax, 1 ; rax = write(fd, buf, count)
	syscall

	; on failure, the write syscall will return a negative number
	; this number is also the respective errno value
	test rax, rax ; if (rax < 0)
	js   .error   ;     jump to .error

	ret

.error:
	neg rax      ; rax *= -1
	mov rdx, rax ; tmp = rax

	; __errno_location returns a pointer to errno variable
	call __errno_location wrt ..plt ; rax = __errno_location()
	mov  [rax], rdx                 ; *rax = tmp

	mov rax, -1 ; return -1
	ret
