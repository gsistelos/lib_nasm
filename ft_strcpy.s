; char *ft_strcpy(char *dest, const char *src);

global ft_strcpy

ft_strcpy:
	; Input:
	;     rdi = dest -> address of the destination string
	;     rsi = src -> address of the source string
	;
	; Output:
	;     rax = address of the destination string

	xor rcx, rcx ; int i = 0

.loop:
	mov dl, [rsi + rcx] ; char c = src[i]
	mov [rdi + rcx], dl ; dest[i] = c

	test dl, dl ; if (c == 0)
	jz   .done  ;     jump to .done

	inc rcx   ; i++
	jmp .loop ; jump to .loop

.done:
	mov rax, rdi ; return dest
	ret
