#!/bin/bash


    # author      : Amal 
    # use case    : jenkins for ubuntu:22.04.
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