# the file permission needed on ec2 

sudo chown -R jenkins /home/ubuntu/
sudo chmod -R u+rwx /home/ubuntu/
sudo chmod -R 755 /home/ubuntu
sudo chown -R jenkins:jenkins /home/ubuntu/
sudo service jenkins restart

# to view the product 
sudo lsof -i -P -n
