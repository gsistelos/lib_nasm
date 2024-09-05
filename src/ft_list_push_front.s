; void ft_list_push_front(t_list **begin_list, void *data);

global ft_list_push_front

extern malloc

ft_list_push_front:
	; Input:
	;     rdi = address to the beginning of the list
	;     rsi = data of the new node

	push rdi
	push rsi

	mov  rdi, 16
	call malloc
	test rax, rax
	jz   .done

	pop rsi
	pop rdi

	mov [rax], rsi     ; new_node->data = data
	mov rsi, [rdi]
	mov [rax + 8], rsi ; new_node->next = *begin_list
	mov [rdi], rax     ; *begin_list = new_node

.done:
	ret
