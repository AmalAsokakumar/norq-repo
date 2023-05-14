#!/bin/bash
sudo mkdir -p /var/www/html/yourdomain.com
sudo chown -R jenkins:jenkins /var/www/html/yourdomain.com
export PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)   
sudo mv Jenkins-react-app /etc/nginx/sites-available/Jenkins-react-app
sudo sed -i "s/PUBLIC_IP/$PUBLIC_IP/g" /etc/nginx/sites-available/Jenkins-react-app
sudo cat /etc/nginx/sites-available/Jenkins-react-app | grep server_name
if [ -h /etc/nginx/sites-enabled/Jenkins-react-app ]; then
    echo "Symbolic link already exists, skipping."
else
    ln -s /etc/nginx/sites-available/Jenkins-react-app /etc/nginx/sites-enabled/Jenkins-react-app
    echo "Symbolic link created successfully."
fi
service nginx start
