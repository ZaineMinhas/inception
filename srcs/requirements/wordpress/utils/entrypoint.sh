# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 15:24:18 by zminhas           #+#    #+#              #
#    Updated: 2022/10/12 11:14:39 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

wp config create	--dbname=$MARIADB_DATABASE \	#generate config file
					--dbuser=MARIADB_USER \
					--dbpass=MARIADB_USER_PASSWORD \
					--dbhost=$MARIADB_HOST \
					--path="/var/www/wordpress" \
					--skip-check \
					--allow-root

if ! wp core is-installed --allow-root; then
	wp core install	--url=$WORDPRESS_URL \		#install wordpress
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--allow-root

	wp plugin update	--all \		#update wordpress
						--allow-root
	
	wp user create	$WORDPRESS_USER $WORDPRESS_USER_EMAIL \		#create user
					--role=editor \
					--user_pass=$WORDPRESS_USER_PASSWORD \
					--allow-root

	wp post generate	--count=1 \		#generate first post
						--post-title="le manque d'idees" \
						--post-author="moi" \
						--post-content="j'ai pas d'idee" \
						--allow-root
fi

php-fpm7.3 --nodaemonize