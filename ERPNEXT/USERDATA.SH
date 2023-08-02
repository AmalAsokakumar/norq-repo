#!/bin/bash 
# ERPNEXT 

# * 80/tcp and 443/tcp for HTTP and HTTPS respectively

# * 3306/tcp for MariaDB connection (recommended only if you need remote access to database)

# * 143/tcp and 25/tcp for IMAP and STMP respectively

# * 22/tcp for SSH (if you have not already enabled OpenSSH in your UFW settings)

# * 8000/tcp for testing your platform before deploying to production -->

sudo apt update 

# configure Keymap, langauge, character encoding: 
sudo localectl set-keymap us && sudo localectl set-locale LANG=en_US.utf8


sudo vi /etc/environment 
# add the following line to your PATH
    # LC_ALL=en_US.UTF-8
    # LC_CTYPE=en_US.UTF-8
    # LANG=en_US.UTF-8

cat /etc/environment
sudo reboot 


# installing maria DB
sudo apt install mariadb-server -y
sudo apt install python3-mysqldb libmysqlclient-dev -y
sudo mysql_secure_installation #( y, n, all y)


# creating a MariaDB super Admin User
sudo mysql
# -> CRATING A DATABASE.
    # CREATE DATABASE sammy;
    # SHOW DATABASES;
# -> CREATING A USER WITH ROOT PREVILATE.
    #GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'%' IDENTIFIED BY 'mariadb-password' WITH GRANT OPTION;
# -> Now confirm both the user creation and the new user’s privileges
    # SELECT host, user, Super_priv FROM mysql.user;
# -> Now flush privileges to apply all changes:
    # FLUSH PRIVILEGES;
    # exit

# Configure Mariadb for ERPNext
sudo systemctl stop mariadb
sudo nano /etc/mysql/mariadb.conf.d/mariadb.cnf
# -> add the following
    #     [mysqld]

    # # GENERAL #
    # user                           = mysql
    # default-storage-engine         = InnoDB
    # socket                         = /var/lib/mysql/mysql.sock
    # pid-file                       = /var/lib/mysql/mysql.pid

    # # MyISAM #
    # key-buffer-size                = 32M
    # myisam-recover                 = FORCE,BACKUP

    # # SAFETY #
    # max-allowed-packet             = 256M
    # max-connect-errors             = 1000000
    # innodb                         = FORCE

    # # DATA STORAGE #
    # datadir                        = /var/lib/mysql/

    # # BINARY LOGGING #
    # log-bin                        = /var/lib/mysql/mysql-bin
    # expire-logs-days               = 14
    # sync-binlog                    = 1

    # # REPLICATION #
    # server-id                      = 1

    # # CACHES AND LIMITS #
    # tmp-table-size                 = 32M
    # max-heap-table-size            = 32M
    # query-cache-type               = 0
    # query-cache-size               = 0
    # max-connections                = 500
    # thread-cache-size              = 50
    # open-files-limit               = 65535
    # table-definition-cache         = 4096
    # table-open-cache               = 10240

    # # INNODB #
    # innodb-flush-method            = O_DIRECT
    # innodb-log-files-in-group      = 2
    # innodb-log-file-size           = 512M
    # innodb-flush-log-at-trx-commit = 1
    # innodb-file-per-table          = 1
    # innodb-buffer-pool-size        = 5462M
    # innodb-file-format             = barracuda
    # innodb-large-prefix            = 1
    # collation-server               = utf8mb4_unicode_ci
    # character-set-server           = utf8mb4
    # character-set-client-handshake = FALSE
    # max_allowed_packet             = 256M

    # # LOGGING #
    # log-error                      = /var/lib/mysql/mysql-error.log
    # log-queries-not-using-indexes  = 0
    # slow-query-log                 = 1
    # slow-query-log-file            = /var/lib/mysql/mysql-slow.log

    # # CONNECTIONS #

    # pid-file        = /var/run/mysqld/mysqld.pid
    # socket          = /var/run/mysqld/mysqld.sock
    # bind-address    = 0.0.0.0

    # [mysql]
    # default-character-set = utf8mb4

    # [mysqldump]
    # max_allowed_packet=256M

# Testing MariaDB Connection

sudo systemctl start mariadb
mysql --user sammy --password mariadb_password --host=localhost --protocol=tcp --port=3306 test
sudo systemctl restart mariadb
sudo systemctl enable mariadb

# Setting UP ERPNext 12
# Installing packages required for EPNext Globally 
sudo DEBIAN_FRONTEND=noninteractive apt install -y curl \
    build-essential \
    python3-testresources \
    python3-setuptools \
    python3-dev \
    libffi-dev \
    python3-pip \
    libcurl4 \
    dnsmasq \
    fontconfig \
    git \
    htop \
    libcrypto++-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libwebp-dev \
    libxext6 \
    libxrender1 \
    libxslt1-dev \
    libxslt1.1 \
    libffi-dev \
    ntpdate \
    postfix \
    python3-dev \
    python-tk \
    screen \
    vim \
    xfonts-75dpi \
    xfonts-base \
    zlib1g-dev \
    apt-transport-https \
    libsasl2-dev \
    libldap2-dev \
    libcups2-dev \
    pv \
    libjpeg8-dev \
    libtiff5-dev \
    tcl8.6-dev \
    tk8.6-dev \
    libdate-manip-perl \
    logwatch

sudo -H python3 -m pip install --upgrade setuptools cryptography psutil

# setting up node and yarn 
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
# sudo nano nodesurce_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
sudo npm install -g yarn
cd /tmp
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo cp /usr/local/bin/wkhtmlto* /usr/bin/
sudo chmod a+x /usr/bin/wk*

# installing redis-server
sudo apt install redis-server -y
sudo systemctl enable redis-server


#installing frappe Bench CLI 
sudo useradd sammy 
sudo mkdir /home/sammy
sudo chown sammy -R /home/sammy

git clone https://github.com/frappe/bench /home/sammy/.bench --depth 1 --branch master
sudo pip3 install -e /home/sammy/.bench

################################################################################

# pending installation. 