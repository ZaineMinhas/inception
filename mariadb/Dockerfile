# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/03 16:16:50 by zminhas           #+#    #+#              #
#    Updated: 2022/10/06 14:41:22 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y && chown -R mysql:mysql /var/lib/mysql

COPY ./utils/entrypoint.sh ./
ENTRYPOINT [ "bash", "entrypoint.sh" ]
