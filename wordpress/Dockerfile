# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 13:10:20 by zminhas           #+#    #+#              #
#    Updated: 2022/10/07 12:00:38 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Installing and updating Debian Buster
FROM debian:buster
RUN	apt-get update -y 
RUN apt-get upgrade -y

#Installing all correct dependencies for php
RUN	apt-get install -y php7.3 php7.3-fpm php7.3-mysql curl

#If /tmp/wordpress/ doesn't exist we create it and work inside
WORKDIR /tmp/wordpress/

COPY utils/entrypoint.sh /tmp/wordpress/
#Not sure if needed
RUN mkdir -p /run/php

#Installing WordPress CLI 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

#Download and extract WordPress core files to default folder (wp cli command)
RUN wp core download --allow-root
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["sh", "/tmp/wordpress/entrypoint.sh"]
