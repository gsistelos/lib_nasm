section .text
    global strcmp

strcmp:
    ; Input:
    ;     rdi = address of the first string
    ;     rsi = address of the second string
    ; Output:
    ;     rax = 0 if the strings are equal, 1 or -1 otherwise

    push rdi
    push rsi

.loop:
    mov al, byte [rdi]
    mov bl, byte [rsi]

    cmp al, bl
    jl .less_than
    jg .greater_than

    cmp al, 0
    je .equal

    inc rdi
    inc rsi
    jmp .loop

.less_than:
    pop rsi
    pop rdi

    mov rax, -1
    ret

.greater_than:
    pop rsi
    pop rdi

    mov rax, 1
    ret

.equal:
    pop rsi
    pop rdi

    xor rax, rax
    ret
