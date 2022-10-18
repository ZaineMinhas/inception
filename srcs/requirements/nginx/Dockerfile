# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 11:24:04 by zminhas           #+#    #+#              #
#    Updated: 2022/10/18 11:04:28 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx openssl -y

RUN openssl req -x509 -nodes \
	-out /etc/ssl/zminhas.42.fr.crt \
	-keyout /etc/ssl/zminhas.42.fr.key \
	-subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=zminhas.42.fr/UID=zminhas"

CMD [ "nginx", "-g", "daemon off;" ]
