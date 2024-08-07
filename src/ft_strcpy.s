global ft_strcpy

section .text

ft_strcpy:
	; Input:
	;     rdi = address of the dst string
	;     rsi = address of the src string
	;
	; Output:
	;     rax = address of the dst string

	push rdi
	push rsi

.loop:
	mov al, byte [rsi]

	mov byte [rdi], al

	cmp al, 0
	je  .end

	inc rdi
	inc rsi
	jmp .loop

.end:
	pop rsi
	pop rdi

	mov rax, rdi
	ret
