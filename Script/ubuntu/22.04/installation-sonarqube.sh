#!/bin/bash

#  author           : amal 
#  operation system : ubuntu:22.04
#  configuration -
#     cloud         : AWS
#     family        : t2.large 
#     cpu           : 2VPC
#     memory        : 8GiB memory 
#  use              : for sonarcube 


# docker installation
   sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
   sudo apt update
   apt-cache policy docker-ce 
   sudo apt install docker-ce -y
   sudo usermod -aG docker ${USER}
   sudo chown $USER:$USER /var/run/docker.sock
   # su - ${USER}
   id -nG

# docker-compose installation
   sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   docker-compose --version
   sudo chown $USER:$USER /var/run/docker.sock
   sudo sysctl -w vm.max_map_count=524288
   sudo sysctl -w fs.file-max=131072
   ulimit -n 131072
   ulimit -u 8192


# # remove this segment when using docker compose file 
#    sudo docker volume create data
#    sudo docker volume create logs
#    sudo docker volume create extensions 
#    docker container run -d -p 9000:9000  --name sonar-qube -v data:/opt/sonarqube/data  -v logs:/opt/sonarqube/logs -v extension:/opt/sonarqube/extensions sonarqube
# # default password: admin, new password: sonar 


# for docker compose 
   # curl -O -L <raw_file_url>
   curl -O -L https://raw.githubusercontent.com/AmalAsokakumar/norq-repo/main/Script/docker-compose-files-for-installations/sonar-docker-compose.yaml
   # wget <raw_file_url>
   docker-compose -f sonar-docker-compose.yaml up -d
