# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/04 15:44:42 by zminhas           #+#    #+#              #
#    Updated: 2022/10/04 15:49:27 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		docker-compose -f docker-compose.yml build

down:
		docker-compose -f docker-compose.yml down

clean:	down
		@echo "clean"

fclean:	clean
		@echo "full cleaned"

re:	fclean all

.PHONY:	all clean fclean re down
