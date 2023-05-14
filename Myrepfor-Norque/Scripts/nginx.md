Open the terminal application by pressing the Ctrl–Alt–T.
Make sure you backup all existing Nginx config file, run:
$ mkdir ~/backups/
$ sudo tar -zcvf ~/backups/nginx-8-Sep-2019.tar.gz /etc/nginx/

Backup config NGINX files on Ubuntu
Click to enalrge
Uninstall Nginx package including all config files data, run:
$ sudo apt purge nginx nginx-common nginx-core

How to uninstall Nginx on Ubuntu or Debian Linux using apt-get command
Click to enlarge
Want to keep the Nginx config files but remove the Nginx packages only? Try:
$ sudo apt remove nginx nginx-common nginx-core
Finally, run the following to delete unwanted libs installed by the Nginx too. Run:
$ sudo apt autoremove
Verify that /etc/nginx/ and /usr/share/nginx/ are empty when you use the purge option:
$ ls -l /etc/nginx/ /usr/share/nginx/
Want to install the Nginx web server again on your server or developer machine? Try the apt command as follows:
$ sudo apt install nginx nginx-common nginx-core
Do I need to remove PHP and Python package files too? That depends upon your needs. When you delete the Nginx, default TCP ports, 80 and 443 are free to use again by Apache or any other web server of your choice.