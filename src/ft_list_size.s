; size_t ft_list_size(t_list *begin_list);

global ft_list_size

ft_list_size:
	; Input:
	;     rdi = begin_list -> address to the beginning of the list
	;
	; Output:
	;     rax = the length of the list

	xor rax, rax ; int i = 0

.loop:
	test rdi, rdi ; if (begin_list == NULL)
	jz   .done    ;     jump to .done

	mov rdi, [rdi + 8] ; begin_list = begin_list->next
	inc rax            ; i++
	jmp .loop          ; jump to .loop

.done:
	ret ; return i
