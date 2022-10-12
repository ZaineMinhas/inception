# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 15:24:18 by zminhas           #+#    #+#              #
#    Updated: 2022/10/12 11:24:45 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

wp config create --dbname=$MARIADB_DATABASE \
					--dbuser=MARIADB_USER \
					--dbpass=MARIADB_USER_PASSWORD \
					--dbhost=$MARIADB_HOST \
					--path="/var/www/wordpress" \
					--skip-check \
					--allow-root	#generate config file

if ! wp core is-installed --allow-root; then
	wp core install --url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--allow-root		#install wordpress

	wp plugin update --all \
						--allow-root		#update wordpress
	
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
					--role=editor \
					--user_pass=$WORDPRESS_USER_PASSWORD \
					--allow-root		#create user

	wp post generate --count=1 \
						--post-title="le manque d'idees" \
						--post-author="moi" \
						--post-content="j'ai pas d'idee" \
						--allow-root		#generate first post
fi

php-fpm7.3 --nodaemonize