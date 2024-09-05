NAME = test

SRC = $(wildcard src/*.c)

OBJ = $(SRC:.c=.o)

LIB_PATH = ..

LIB_INCLUDE = $(LIB_PATH)/include

LIB = $(LIB_PATH)/libasm.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror -I$(LIB_INCLUDE)

RM = rm -f


.PHONY: all
all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	$(CC) -no-pie $(OBJ) -lcriterion -L$(LIB_PATH) -lasm -o $(NAME)

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
