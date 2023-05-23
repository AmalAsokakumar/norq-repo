sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
sudo docker volume create data
sudo docker volume create logs
sudo docker volume create extensions 
sudo chown $USER:$USER /var/run/docker.sock
docker container run -d -p 9000:9000  --name sonar-qube -v data:/opt/sonarqube/data  -v logs:/opt/sonarqube/logs -v extension:/opt/sonarqube/extensions sonarqube 
# default password: admin, new password: sonar