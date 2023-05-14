sudo usermod -aG docker $USER # on the hostmachine where docker is installed
sudo chgrp docker /var/run/docker.sock
sudo chmod g+rw /var/run/docker.sock
# then restart the machine 
