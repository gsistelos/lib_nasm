; int ft_strcmp(const char *s1, const char *s2);

global ft_strcmp

ft_strcmp:
	; Input:
	;     rdi = s1 -> address of the first string
	;     rsi = s2 -> address of the second string
	;
	; Output:
	;     rax = an integer indicating the result of the comparison, as follows:
	;            0, if the s1 and s2 are equal;
	;            a negative value if s1 is less than s2;
	;            a positive value if s1 is greater than s2.

.loop:
	mov al, byte [rdi] ; char c1 = *s1
	mov dl, byte [rsi] ; char c2 = *s2

	cmp al, dl     ; if (c1 != c2)
	jne .not_equal ;     jump to .not_equal

	test al, al ; if (c1 == 0)
	jz   .done  ;     jump to .done

	inc rdi   ; s1++
	inc rsi   ; s2++
	jmp .loop ; jump to .loop

.not_equal:
	; the subtraction is done using 64-bits registers
	movzx rax, al ; int i1 = c1
	movzx rdx, dl ; int i2 = c2

	sub rax, rdx ; return i1 - i2
	ret

.done:
	xor rax, rax ; return 0
	ret
