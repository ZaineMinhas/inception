# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_docker.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/27 19:13:59 by zminhas           #+#    #+#              #
#    Updated: 2022/09/27 19:14:20 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt-get install docker-ce docker-compose -y
sudo systemctl status docker