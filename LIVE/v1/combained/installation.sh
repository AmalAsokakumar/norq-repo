#!/bin/bash

        # author : Amal 
        # use case : jenkins, docker, docker-compose, nodejs, jdk, mongodb for ubuntu:22.04
        # reference link  : https://www.fosstechnix.com/how-to-install-mongodb-on-ubuntu-22-04-lts/
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
# sudo chown $USER:$USER /var/run/docker.sock
sudo chown jenkins:jenkins /var/run/docker.sock 
# su - ${USER}
id -nG

# docker-compose installation
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# installing node-on ubuntu.
sudo apt update
sudo apt install curl ca-certificates gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository "deb https://deb.nodesource.com/node_16.x $(lsb_release -cs) main" -y
sudo apt update
sudo apt install nodejs -y
node -v
which node 

# installing node js 
cd ~ || exit
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs
node -v

# installing mongodb 
sudo apt update 
sudo apt install -y wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release 
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update 
sudo apt install -y mongodb-org 
sudo systemctl enable --now mongod
sudo systemctl status mongod
mongod --version
# enable remote connection to mongoDB > go to the reference link for that.

# changing the file permission 
sudo chown -R jenkins /home/ubuntu/
sudo chmod -R u+rwx /home/ubuntu/
sudo chmod -R 755 /home/ubuntu
sudo chown -R jenkins:jenkins /home/ubuntu/
sudo service jenkins restart

# installing pm2 
npm install -g pm2
