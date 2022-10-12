# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 13:10:20 by zminhas           #+#    #+#              #
#    Updated: 2022/10/12 10:55:30 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl php7.3 php7.3-fpm php7.3-mysql
RUN mkdir -p /run/php
COPY ./utils/entrypoint.sh ./

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
RUN wp core download --allow-root
RUN chown -R www-data:www-data /var/www/wordpress

ENTRYPOINT [ "bash", "entrypoint.sh" ]
