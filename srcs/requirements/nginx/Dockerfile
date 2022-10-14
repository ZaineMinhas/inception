# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/13 11:24:04 by zminhas           #+#    #+#              #
#    Updated: 2022/10/14 17:00:22 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx openssl -y

RUN openssl req -newkey rsa:4096 -x509 -sha256 -nodes -out MyCertificate.crt -keyout MyKey.key
# creer certif ssl

# bien lancer nginx (sans les demon)

# ecrire nginx.conf
