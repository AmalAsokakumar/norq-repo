#!/bin/bash

        # author : Amal 
        # use case : jenkins, docker, docker-compose, for ubuntu:22.04
        # description : 

# creating a user
adduser jenkins
usermod -aG sudo jenkins

# installing openjdk 
sudo apt update
java -version
sudo apt install default- -y
java -version
sudo apt install default-jdk -y
javac -version

# installing jenkins 
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

# starting jenkins
sudo systemctl start jenkins.service
sudo systemctl status jenkins
sudo systemctl enable jenkins 

# docker installation
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
sudo apt update
apt-cache policy docker-ce 
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
sudo chown $USER:$USER /var/run/docker.sock
# su - ${USER}
id -nG

# docker-compose installation
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version