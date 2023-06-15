#!/bin/bash

# Step 1: Update System Dependencies
# Step 2: Add PHP PPA
# Step 3: Install PHP 8.x for Apache
# Step 4: Install PHP 8.x Extensions
# Step 5: Verify PHP Version
# Step 6: Configure PHP 8.x

# Step 1: Update System Dependencies
sudo apt update
sudo apt upgrade -y

# Step 2: Add PHP PPA 
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

# Step 3: Update System Dependencies
sudo apt install php8.1 -y
php -v

# Step 4: Update System Dependencies
    # installing php extensions with the following command
    # sudo apt install php8.1-extension_name 
    # most commonly used php extesions are as follows:
sudo apt install php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-redis php8.1-intl -y

#step 5: Veriy PHP version
php -v

# step 6: Configure PHP 8.x
# sudo nano /etc/php/8.1/apache2/php.ini

# upload_max_filesize = 32M 
# post_max_size = 48M 
# memory_limit = 256M 
# max_execution_time = 600 
# max_input_vars = 3000 
# max_input_time = 1000

sudo service apache2 restart 

# installing mysql server

# ref https://dev.to/gsudarshan/how-to-install-mysql-and-workbench-on-ubuntu-20-04-localhost-5828
sudo apt-get install mysql-server -y
# add the following step in the secure installaion utility does not start. 
# sudo mysql_secure_installation utility

# for remote access.
# sudo ufw enable
# sudo ufw allow mysql

sudo systemctl start mysql

