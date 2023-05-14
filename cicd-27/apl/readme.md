create a jenkins instances 

system requirments 
t2.medium 
storage 8gb gp2 
tag:
key name 
value jenkens 





needed nginx 

sudo apt install nginx
sudo systemctl start nginx 

configure nginx 
cd /etc/nginx/sites-enabled # don't need to make any changes. keep it as it is. 
go to ->  /var/www/htm  -< this is where the static files will be placed.



create a build of the application using yarn or npm 
then copy it using scp 



additional steps 

creating ssh key 
ssh-keygen -t rsa -f <name of the key file>
mkdir ~/.ssh
mv <name of the key file> ~/.ssh
mv <name of the key file.pub> ~/.ssh
ssh-add -k <name of the key file> # this step is only needed for mac os. 

