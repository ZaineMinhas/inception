# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/04 15:44:42 by zminhas           #+#    #+#              #
#    Updated: 2022/10/05 12:06:49 by zminhas          ###   ########.fr        #
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
		docker-compose -f docker-compose.yml build
		mkdir -p /home/zminhas/data/database
		docker-compose -f docker-compose.yml up
		@echo "${GREEN}ready!${RESET}"

up:		
		docker-compose -f docker-compose.yml up

down:
		docker-compose -f docker-compose.yml down

clean:	down
		# docker-compose -f docker-compose.yml -v --rmi all
		docker volume rm inception_mariadb_volume
		@echo "${YELLOW}cleaned${RESET}"

fclean:	clean
		@docker image rm mariadb
		@docker image rm debian:buster
		@rm -rf /home/zminhas/datadock
		@echo "${RED}full cleaned${RESET}"

re:	fclean all
	@echo "${LIGHTPURPLE}re-ready!${RESET}"

.PHONY:	all clean fclean re down
