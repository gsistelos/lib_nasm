section .text
    extern strlen

    global puts

puts:
    ; Input: rdi = address of the string
    ; Output: rax = the number of bytes written

    call strlen

    mov rsi, rdi
    mov rdi, 1
    mov rdx, rax
    mov rax, 1      ; write(fd: rdi, buf: rsi, count: rdx)
    syscall

    ret
