#!/bin/bash
# install jekins 
sudo yum -y update
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y upgrade
sudo amazon-linux-extras install java-openjdk11 -y 
sudo yum -y install jenkins -y 
sudo systemctl start jenkins 
sudo systemctl enable jenkins 
sudo systemctl status jenkins 

# docker setup
yum -y install docker
systemctl start docker 
systemctl enable docker 

#git setup 
yum -y install git 
git config --global pack.windowMemory "100m"
git config --global pack.packSizeLimit "100m"
git config --global pack.threads "1"

vi /etc/sudoers 
## same thing without a password 
# %wheel ALL=(ALL) NOPASSWORD: ALL
jenkins ALL=(ALL) NOPASSWORD: ALL
