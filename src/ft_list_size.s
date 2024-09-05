; size_t ft_list_size(t_list *begin_list);

global ft_list_size

ft_list_size:
	; Input:
	;     rdi = address to the beginning of the list
	;
	; Output:
	;     rax = the length of the list

	xor rax, rax

.loop:
	test rdi, rdi
	jz   .done

	mov rdi, [rdi + 8] ; begin_list = begin_list->next
	inc rax
	jmp .loop

.done:
	ret
