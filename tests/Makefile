NAME = test

SRC = main.c

OBJ = $(SRC:.c=.o)

LIB_PATH = ..

LIB = $(LIB_PATH)/libasm.a

CC = cc -no-pie

CFLAGS = -Wall -Wextra -Werror -I$(LIB_PATH)

RM = rm -f


.PHONY: all
all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	$(CC) $(OBJ) $(LIB) -o $(NAME)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

LIB:
	make -C $(LIB_PATH)

.PHONY: clean
clean:
	$(RM) $(OBJ)

.PHONY: fclean
fclean: clean
	$(RM) $(NAME)

.PHONY: re
re: clean all
