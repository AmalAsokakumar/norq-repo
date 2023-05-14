# run sonarqube as docker image.
    - minimum 2 gb ram 

(docker hub url)[https://hub.docker.com/_/sonarqube]
#Docker Host Requirements
```
sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
docker create volume data
docker create volume logs
docker create extensions 
docker container create --name sonar-qube -v data:/opt/sonarqube/data  -v logs:/opt/sonarqube/logs -v extension:/opt/sonarqube/extensions -d sonarqube 

```
# Use volumes

####We recommend creating volumes for the following directories:

1.  /opt/sonarqube/data: data files, such as the embedded H2 database and Elasticsearch indexes

2.  /opt/sonarqube/logs: contains SonarQube logs about access, web process, CE process, Elasticsearch logs

3.  /opt/sonarqube/extensions: for 3rd party plugins

# Warning: You cannot use the same volumes on multiple instances of SonarQube.

