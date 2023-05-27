#!/bin/bash
'''
    author          : amal 
    use             : backend code deployment 
    contents        : nodejs version 16.19, mongodb, jdk, jenkins 
    reference link  : https://www.fosstechnix.com/how-to-install-mongodb-on-ubuntu-22-04-lts/
'''
# installing node js 
cd ~
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