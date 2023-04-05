NAME		=	libftprintf.a

LIBFT_DIR	=	./libft
LIBFT		=	${LIBFT_DIR}/libft.a

INCS_DIR	=	./include

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror
INCS		=	-I${INCS_DIR} -I${LIBFT_DIR}
LFLAGS		=	-L${LIBFT_DIR} -lft
LIB			=	ar -crs
LIB1		=	ranlib
RM			=	/bin/rm -f

SRC_DIR		=	./srcs
SRC			=	${SRC_DIR}/ft_printf.c \
				${SRC_DIR}/ft_format_specifiers_2.c \
				${SRC_DIR}/ft_printf_utils.c \
				${SRC_DIR}/ft_eval_format.c \
				${SRC_DIR}/ft_format_specifiers.c

OBJECTS		=	$(SRC:.c=.o)

all:		$(NAME)

$(NAME):	${OBJECTS} ${LIBFT}
				${LIB} ${NAME} $(OBJECTS)
				${LIB1} ${NAME}

.c.o:		${CC} ${CFLAGS} ${INCS} -c $< -o $(<:.c=.o)

$(LIBFT):
			make -C ${LIBFT_DIR}
			cp ${LIBFT} ${NAME}

clean:		
			make clean -C ${LIBFT_DIR}
			${RM} ${OBJECTS}

fclean:			clean
			make fclean -C ${LIBFT_DIR}
			${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
