global ft_strcmp

section .text

ft_strcmp:
	; Input:
	;     rdi = address of the first string
	;     rsi = address of the second string
	;
	; Output:
	;     rax = an integer indicating the result of the comparison, as follows:
	;           0, if the s1 and s2 are equal;
	;           a negative value if s1 is less than s2;
	;           a positive value if s1 is greater than s2.

	push rdi
	push rsi

.loop:
	mov al, byte [rdi]
	mov bl, byte [rsi]

	cmp al, bl
	jne .not_equal

	cmp al, 0
	je  .equal

	inc rdi
	inc rsi
	jmp .loop

.not_equal:
	pop rsi
	pop rdi

	movzx rax, al
	movzx rbx, bl

	sub rax, rbx
	ret

.equal:
	pop rsi
	pop rdi

	xor rax, rax
	ret
