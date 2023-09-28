section .text
    global strlen

strlen:
    ; Input: rdi = address of the string
    ; Output: rax = length of the string

    push rdi
    xor rax, rax

.loop:
    cmp byte [rdi], 0
    je .done

    inc rax
    inc rdi
    jmp .loop

.done:
    pop rdi
    ret
