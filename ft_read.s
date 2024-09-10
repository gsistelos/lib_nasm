; ssize_t ft_read(int fd, void *buf, size_t count);

global ft_read

extern __errno_location

ft_read:
	; Input:
	;     rdi = fd -> file descriptor
	;     rsi = buf -> buffer
	;     rdx = count -> number of bytes to read
	;
	; Output:
	;     rax = number of bytes read, -1 on error

	mov rax, 0 ; rax = read(fd, buf, count)
	syscall

	; on failure, the read syscall will return a negative number
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
