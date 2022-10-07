# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/04 15:44:42 by zminhas           #+#    #+#              #
#    Updated: 2022/10/07 13:58:19 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BLACK		= $(shell tput -Txterm setaf 0)
RED			= $(shell tput -Txterm setaf 1)
GREEN		= $(shell tput -Txterm setaf 2)
YELLOW		= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	= $(shell tput -Txterm setaf 4)
PURPLE		= $(shell tput -Txterm setaf 5)
BLUE		= $(shell tput -Txterm setaf 6)
WHITE		= $(shell tput -Txterm setaf 7)
RESET		= $(shell tput -Txterm sgr0)

all:
		docker-compose -f ./srcs/docker-compose.yml build
		mkdir -p /home/zminhas/data/database
		mkdir -p /home/zminhas/data/wordpress
		docker-compose -f ./srcs/docker-compose.yml up
		@echo "${GREEN}ready!${RESET}"

up:		
		docker-compose -f ./srcs/docker-compose.yml up

down:
		docker-compose -f ./srcs/docker-compose.yml down

clean:	down
		docker volume rm srcs_inception_mariadb_volume
		docker volume rm srcs_inception_wordpress_volume
		@echo "${YELLOW}cleaned${RESET}"

fclean:	clean
		@docker image rm mariadb
		@docker image rm wordpress
		@docker image rm debian:buster
		@rm -rf /home/zminhas/database
		@echo "${RED}full cleaned${RESET}"

re:	fclean all
	@echo "${LIGHTPURPLE}re-ready!${RESET}"

.PHONY:	all clean fclean re down
