# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/03 16:41:46 by zminhas           #+#    #+#              #
#    Updated: 2022/10/12 11:47:58 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -d /var/lib/mysql/$MARIADB_DATABASE ]; then
	service mysql start --datadir=/var/lib/mysql

	echo "create $MARIADB_DATABASE"
	eval "echo \"$(cat config.sql)\"" | mariadb -u root

	service mysql stop --datadir=/var/lib/mysql
fi

echo "$MARIADB_DATABASE ready"
mysqld_safe --datadir=/var/lib/mysql
