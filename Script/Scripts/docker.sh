#!/bin/bash
sudo mkdir /var/www/jenkins-react-app
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
sudo apt update
apt-cache policy docker-ce 
sudo apt install docker-ce -y

# sudo systemctl status docker
sudo usermod -aG docker ${USER}
sudo chown $USER:$USER /var/run/docker.sock
# su - ${USER}
id -nG