#!/bin/bash
# operating system : ubuntu 22.04
# ram size : 4 gb

# setting up the system 
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common 
sudo add-apt-repository  ppa:ondrej/php libapache2-mod-php -y 

sudo apt install \
 php-imagick \
 php8.2-common \
 php8.2-mysql \
 php8.2-gd \
 php8.2-bcmath \
 php8.2-curl \
 php8.2-zip \
 php8.2-xml \
 php8.2-mbstring \
 php8.2-bz2 \
 php8.2-intl  -y


# installing mysql, apache server 
sudo apt install mysql-server apache2 unzip -y

# start Apache and MariaDB
sudo systemctl start apache2
sudo systemctl start mysql.service

# Restart Apache   
sudo systemctl restart apache2

# creating a database
    # sudo mysql
    # create database akaunting;
    # create user 'accountant'@'localhost' identified by 'your-password';
    # grant all privileges on akaunting.* to 'accountant'@'localhost';
    # flush privileges;
    # exit;
# Execute MySQL commands
sudo mysql <<EOF
create database akaunting;
create user 'accountant'@'localhost' identified by 'your-password';
grant all privileges on akaunting.* to 'accountant'@'localhost';
flush privileges;
exit;
EOF

# downloadin the lates version of the code
wget -O Akaunting.zip https://akaunting.com/download.php?version=latest
sudo unzip Akaunting.zip -d /var/www/akaunting/

#Set the correct permissions:
sudo chown -R www-data:www-data /var/www/akaunting
sudo chmod -R 755 /var/www/akaunting

#Create an Apache virtual host for Akaunting:
sudo touch /etc/apache2/sites-available/akaunting.conf

# Add the following content to the file

# this stage is not working.
sudo echo " 
<VirtualHost *:80>
    ServerName akaunting.norqlabs.com
    DocumentRoot /var/www/akaunting/

    <Directory /var/www/akaunting/>
       DirectoryIndex index.php
       Options +FollowSymLinks
       AllowOverride All
       Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/akaunting.error.log
    CustomLog ${APACHE_LOG_DIR}/akaunting.access.log combined

</VirtualHost>
" > /etc/apache2/sites-available/akaunting.conf

#Enable the virtual host and restart Apache:
sudo a2ensite akaunting.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo a2dissite 000-default.conf
sudo systemctl restart apache2

#SSL Certificate Installation (Enabling HTTPS)

sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache --agree-tos --redirect --hsts --staple-ocsp --email amal.a@norq.in -d akaunting.norqlabs.com -y

# additional steps 
# sudo apt install libapache2-mod-php
# sudo service apache2 restart
# sudo systemctl restart apache2

