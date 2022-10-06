# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    set_env.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zminhas <zminhas@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/27 19:13:59 by zminhas           #+#    #+#              #
#    Updated: 2022/10/06 10:43:00 by zminhas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt-get install docker-ce docker-compose make -y
sudo adduser $USER docker
sudo reboot