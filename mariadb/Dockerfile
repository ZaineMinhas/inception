# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/03 16:16:50 by zminhas           #+#    #+#              #
#    Updated: 2022/10/07 11:58:24 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Installing and updating Debian Buster
FROM debian:buster
RUN apt-get update
RUN apt-get upgrade -y

#MariaDB will be our database
RUN apt-get install mariadb-server -y

#Copy database creation and configutation
COPY ./utils/entrypoint.sql /tmp/entrypoint.sql

#Copy more configuration details given in the .cnf
COPY utils/mariadb.cnf /etc/mysql/

#Copy .sh script to execute everything
COPY ./utils/entrypoint.sh ./

# This execution of the  script is now the starting point
ENTRYPOINT [ "sh", "entrypoint.sh" ]
