# installing nodejs npm and nginx on the machine.
sudo apt install -y nginx npm nodejs
# creating a root folder to server our files.
sudo mkdir /var/www/html/yourdomain.com
sudo chown jenkins:jenkins /var/www/html/yourdomain.com

# sudo apt purge nginx nginx-common nginx-core # to uninstall nginx. 