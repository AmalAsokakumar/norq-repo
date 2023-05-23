#!/bin/bash
# installing latest node package
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

# other commands for node are as follows for
# node -v             --- to view the version of the node 
# nvm  use <version>  --- to use that particular version of node
# nvm use latest      --- to install latest version of the node
# nvm install <version to install a paticular version 
