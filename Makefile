NAME        := push_swap
LIBFT_DIR   := libft
LIBFT       := $(LIBFT_DIR)/libft.a
CC          := cc
CFLAGS      := -Wall -Wextra -Werror

SRCS_PUSH_SWAP := \
	push_swap_main.c \
	operations1.c \
	operations2.c \
	operations3.c \
	operations_print.c \
	operations_print2.c \
	operations_print3.c \
	sorting_small.c \
	chunk_sort.c \
	utils.c \
	utils_list.c \
	utils_checks.c

OBJS_PUSH_SWAP := $(SRCS_PUSH_SWAP:.c=.o)

.PHONY: all clean fclean re

all: $(NAME)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS_PUSH_SWAP) $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(OBJS_PUSH_SWAP) $(LIBFT)

clean:
	rm -f $(OBJS_PUSH_SWAP)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all
