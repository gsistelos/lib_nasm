global ft_strlen

section .text

ft_strlen:
	; Input:
	;     rdi = address of the string
	;
	; Output:
	;     rax = length of the string

	push rdi
	xor rax, rax

.loop:
	cmp byte [rdi], 0
	je  .end

	inc rax
	inc rdi
	jmp .loop

.end:
	pop rdi
	ret
