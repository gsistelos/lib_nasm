; char *ft_strdup(const char *s);

global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
	; Input:
	;     rdi = s -> the address of the string
	;
	; Output:
	;     rax = the address of the new string

	; save register
	push rdi

	call ft_strlen ; rax = ft_strlen(s)
	inc  rax       ; rax++

	mov  rdi, rax         ; rax = malloc(rax)
	call malloc wrt ..plt

	test rax, rax ; if (rax == 0)
	jz   .done    ;     jump to .done

	mov  rdi, rax  ; rax = ft_strcpy(rax, s)
	pop  rsi       ; load register
	call ft_strcpy

.done:
	ret ; return rax
