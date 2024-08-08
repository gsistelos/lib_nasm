; char *ft_strcpy(char *dest, const char *src);

global ft_strcpy

section .text

ft_strcpy:
	; Input:
	;     rdi = address of the destination string
	;     rsi = address of the source string
	;
	; Output:
	;     rax = address of the destination string

	mov rax, rdi

.loop:
	mov bl, [rsi]
	mov [rdi], bl

	test bl, bl
	jz   .done

	inc rdi
	inc rsi
	jmp .loop

.done:
	ret
