NAME = libasm.a

SRC = $(addprefix src/, ft_list_push_front.s ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s ft_write.s)

OBJ = $(SRC:.s=.o)

AS = nasm

ASFLAGS = -f elf64 -Iinclude

RM = rm -f


.PHONY: all
all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

.s.o:
	$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	$(RM) $(OBJ)

.PHONY: fclean
fclean:
	$(RM) $(OBJ) $(NAME)

.PHONY: re
re: fclean all
