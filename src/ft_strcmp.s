; int ft_strcmp(const char *s1, const char *s2);

global ft_strcmp

section .text

ft_strcmp:
	; Input:
	;     rdi = address of the first string
	;     rsi = address of the second string
	;
	; Output:
	;     rax = an integer indicating the result of the comparison, as follows:
	;            0, if the s1 and s2 are equal;
	;            a negative value if s1 is less than s2;
	;            a positive value if s1 is greater than s2.

.loop:
	mov al, byte [rdi]
	mov bl, byte [rsi]

	cmp al, bl
	jne .not_equal

	test al, al
	jz   .done

	inc rdi
	inc rsi
	jmp .loop

.not_equal:
	movzx rax, al
	movzx rbx, bl

	sub rax, rbx
	ret

.done:
	xor rax, rax
	ret
