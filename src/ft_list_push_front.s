; void ft_list_push_front(t_list **begin_list, void *data);

global ft_list_push_front

extern malloc

ft_list_push_front:
	; Input:
	;     rdi = begin_list -> address to the beginning of the list
	;     rsi = data -> data of the new node

	; save registers
	push rdi
	push rsi

	mov  rdi, 16          ; rax = malloc(16)
	call malloc wrt ..plt

	test rax, rax ; if (rax == NULL)
	jz   .done    ;     jump to .done

	; load registers
	pop rsi
	pop rdi

	mov [rax], rsi     ; rax->data = data

	mov rsi, [rdi]     ; tmp = *begin_list
	mov [rax + 8], rsi ; rax->next = tmp

	mov [rdi], rax     ; *begin_list = rax

.done:
	ret ; return
