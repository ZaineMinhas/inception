# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/03 16:41:46 by zminhas           #+#    #+#              #
#    Updated: 2022/10/03 17:58:36 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ ! -d /var/lib/mysql/$MARIADB_DATABASE ]; then
	service mysql start

	mysql -e "UPDATE mysql.user SET Password=PASSWORD($MARIADB_PASSOWRD) WHERE User=’root’;"
	mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
	mysql -e "DELETE FROM mysql.user WHERE User='';"
	mysql -e "DROP DATABASE test;"
	mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"

	echo "create $MARIADB_DATABASE"
	mysql -e CREATE DATABASE $MARIADB_DATABASE

	mysql -e "FLUSH PRIVILEGES;"

	service mysql stop
fi
