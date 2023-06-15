

To install Akaunting on Ubuntu 22.04 or 20.04, follow these steps:

Update the system:
sudo apt update && sudo apt upgrade
Install LAMP stack And PHP 8.0:
-php 8.0
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.0

sudo apt install software-properties-common

sudo add-apt-repository ppa:ondrej/php -y

sudo apt install php-imagick php8.0-common php8.0-mysql php8.0-gd php8.0-bcmath php8.0-curl php8.0-zip php8.0-xml php8.0-mbstring php8.0-bz2 php8.0-intl

-Install Apache And mysql
Mysql
sudo apt install mysql-server

Apache

sudo apt install apache2
Start Apache and MariaDB:
sudo systemctl start apache2
sudo systemctl start mysql.service
Restart Apache

sudo systemctl restart apache2
Create a database and user for Akaunting:
sudo mysql

create database akaunting;

create user 'accountant'@'localhost' identified by 'your-password';

grant all privileges on akaunting.* to 'accountant'@'localhost';

flush privileges;

exit;
Download the latest version of Akaunting:
wget -O Akaunting.zip https://akaunting.com/download.php?version=latest
Unzip the downloaded file:
sudo apt install unzip

sudo unzip Akaunting.zip -d /var/www/akaunting/
Set the correct permissions:
sudo chown -R www-data:www-data /var/www/akaunting
sudo chmod -R 755 /var/www/akaunting
Create an Apache virtual host for Akaunting:
sudo nano /etc/apache2/sites-available/akaunting.conf
Add the following content to the file:

<VirtualHost *:80>
    ServerName accounting.yourdomain.com
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
Enable the virtual host and restart Apache:
sudo a2ensite akaunting.conf

sudo a2enmod rewrite

sudo systemctl restart apache2

sudo a2dissite 000-default.conf

sudo systemctl restart apache2
SSL Certificate Installation (Enabling HTTPS)

sudo apt install certbot

sudo apt install python3-certbot-apache

sudo certbot --apache --agree-tos --redirect --hsts --staple-ocsp --email you@example.com -d accounting.yourdomain.com

Open your web browser and access Akaunting by visiting http://akaunting.local or http://<server_ip>.
Complete the setup wizard and start using Akaunting!
Note: Replace password in step 5 with your desired password, and replace admin@example.com in step 10 with your email address.

Now go to https://accounting.yourdomain.com/install and the setup wizard will appear. First, you need to choose your language.