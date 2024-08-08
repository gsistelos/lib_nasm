NAME = test

SRC = $(wildcard src/*.c)

OBJ = $(SRC:.c=.o)

LIB_PATH = ..

LIB = $(LIB_PATH)/libasm.a

CC = cc

CFLAGS = -Wall -Wextra -Werror -I$(LIB_PATH)

RM = rm -f


.PHONY: all
all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	$(CC) -no-pie -lcriterion $(OBJ) $(LIB) -o $(NAME)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB):
	make -C $(LIB_PATH)

.PHONY: clean
clean:
	make -C $(LIB_PATH) clean
	$(RM) $(OBJ)

.PHONY: fclean
fclean:
	make -C $(LIB_PATH) fclean
	$(RM) $(OBJ) $(NAME)

.PHONY: re
re: fclean all
