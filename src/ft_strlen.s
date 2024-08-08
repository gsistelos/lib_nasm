; size_t ft_strlen(const char *s);

global ft_strlen

section .text

ft_strlen:
	; Input:
	;     rdi = address of the string
	;
	; Output:
	;     rax = length of the string

	xor rax, rax

.loop:
	mov bl, [rdi]

	test bl, bl
	jz   .done

	inc rax
	inc rdi
	jmp .loop

.done:
	ret
