#!/bin/bash

sudo apt update && sudo apt upgrade -y

# installing mysql server.
sudo apt install mysql-server -y
sudo systemctl start mysql.service

# configuring mysql server.
sudo mysql <<EOF
create database akaunting;
create user 'accountant'@'localhost' identified by 'your-password';
grant all privileges on akaunting.* to 'accountant'@'localhost';
flush privileges;
exit;
EOF