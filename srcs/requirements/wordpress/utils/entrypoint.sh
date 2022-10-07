# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 15:24:18 by zminhas           #+#    #+#              #
#    Updated: 2022/10/07 14:44:23 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "create config.php"
rm -rf /var/www/wordpress/wp-config.php
wp config create \
	--dbname=$MARIADB_DATABASE \
	--dbuser=$MARIADB_USER \
	--dbpass=$MARIADB_USER_PASSWORD \
	--dbhost=$MARIADB_HOST \
	--path="/var/www/wordpress/" \
	--allow-root \
	--skip-check

if ! wp core is-installed --path="/var/www/wordpress/" --allow-root; then
	echo "install wordpress"
	wp core install \
		--url=$WORDPRESS_URL \
		--title=$WORDPRESS_TITLE \
		--admin_user=$WORDPRESS_ROOT \
		--admin_password=$WORDPRESS_ROOT_PASSWORD \
		--path="/var/www/wordpress/" \
		--allow-root \
		--skip-email
fi
