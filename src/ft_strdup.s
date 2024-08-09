; char *ft_strdup(const char *s);

extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

section .text

ft_strdup:
	; Input:
	;     rdi = the address of the string
	;
	; Output:
	;     rax = the address of the new string

	push rdi

	call ft_strlen
	inc rax

	mov rdi, rax
	call malloc

	mov rdi, rax
	pop rsi
	call ft_strcpy

	ret
