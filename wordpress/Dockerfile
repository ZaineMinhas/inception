# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 13:10:20 by zminhas           #+#    #+#              #
#    Updated: 2022/10/06 15:05:23 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl php7.3 php7.3-fpm php7.3-mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress
RUN wp core download --path="/var/www/wordpress/" --allow-root

COPY ./utils/entrypoint.sh ./
ENTRYPOINT [ "bash", "entrypoint.sh" ]
