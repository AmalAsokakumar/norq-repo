#!/bin/bash
'''
    author          : amal 
    use             : backend code deployment 
    contents        : nodejs installation, version 16.19
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
sudo apt install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update 
sudo apt install -y mongodb-org 
sudo systemctl enable --now mongod
sudo systemctl status mongod
mongod --version
# enable remote connection to mongoDB