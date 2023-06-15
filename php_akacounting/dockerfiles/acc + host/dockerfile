FROM ubuntu:22.04

# Set up the system
RUN apt update && apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y 

RUN apt install \
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
    php8.2-intl -y

RUN apt install apache2 unzip -y
RUN apt install libapache2-mod-php -y

# Download the latest version of the code
RUN apt install wget -y
RUN wget -O Akaunting.zip https://akaunting.com/download.php?version=latest
RUN unzip Akaunting.zip -d /var/www/akaunting/
RUN chown -R www-data:www-data /var/www/akaunting
RUN chmod -R 755 /var/www/akaunting

# Create an Apache virtual host for Akaunting
RUN echo "<VirtualHost *:80>\n\
    ServerName akaunting.norqlabs.com\n\
    DocumentRoot /var/www/akaunting/\n\
    <Directory /var/www/akaunting/>\n\
        DirectoryIndex index.php\n\
        Options +FollowSymLinks\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
    ErrorLog \${APACHE_LOG_DIR}/akaunting.error.log\n\
    CustomLog \${APACHE_LOG_DIR}/akaunting.access.log combined\n\
</VirtualHost>" > /etc/apache2/sites-available/akaunting.conf

RUN a2ensite akaunting.conf
RUN a2enmod rewrite
RUN a2dissite 000-default.conf

# SSL Certificate Installation (Enabling HTTPS)
RUN apt install certbot python3-certbot-apache -y
# Skip the certification stage.
# RUN certbot --apache --agree-tos --redirect --hsts --staple-ocsp --email amal.a@norq.in -d akaunting.norqlabs.com -y

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
