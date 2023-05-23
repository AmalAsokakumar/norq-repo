#!/bin/bash
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
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y 
# starting jenkins
sudo systemctl start jenkins.service
sudo systemctl status jenkins
sudo systemctl enable jenkins 