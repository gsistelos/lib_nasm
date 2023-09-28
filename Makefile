TARGET = libasm.a

SRC = $(addprefix src/, strlen.asm)

OBJ = $(SRC:.asm=.o)

AS = nasm

ASFLAGS = -f elf64

RM = rm -f

all: $(TARGET)

$(TARGET): $(OBJ)
	ar rcs $(TARGET) $(OBJ)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(OBJ) $(TARGET)

re: clean all

.PHONY: all clean re
