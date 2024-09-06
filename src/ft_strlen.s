; size_t ft_strlen(const char *s);

global ft_strlen

ft_strlen:
	; Input:
	;     rdi = str -> address of the string
	;
	; Output:
	;     rax = length of the string

	xor rax, rax ; int i = 0

.loop:
	mov dl, [rdi + rax] ; char c = str[i]

	test dl, dl ; if (c == 0)
	jz   .done  ;     jump to .done

	inc rax   ; i++
	jmp .loop ; jump to .loop

.done:
	ret ; return i
