# To deploy django based application using AWS `CI-CD`
## building a cicd pipeline on aws for django

it has to following these steps. 
- iam creation 
- aws account creation 
- create an ec2 instance 
- installation code deploy 
- Structure the code (react)
- create configuration files 
- setup codebuild, codedeploy, codepipeline 
- test project on live server 


## 1. Creating  <span style="color:olive" >IAM </span>Roles 
1. Role one attach with ec2.
   <br> <span style="color:teal"> Creating the First Role. </span>
    ```
    IAM -> Roles -> Create role
        - Select trusted entity -> Trusted entity type -> AWS service
        - Use case -> EC2
        - Add permissions -> AmazonEC2RoleforAWSCodeDeploy
        - Name, review, and create -> Role details -> ec2-code-deploy-s3
    ```
2. attach with our code deploy.
       <br> <span style="color:teal"> Creating the Second Role. </span>

    ```
    IAM -> Roles -> Create role
        - Select trusted entity -> Trusted entity type -> AWS service
        - Use case for other AWS service -> CodeDeploy -> CodeDeploy
        - Name, review, and create -> Role details -> aws-codedeploy-role
    ```
## 2. Creating  <span style="color:olive" >Ec2 </span>instances 
- AMI
- CodeDeploy agent

1. <span style="color:teal"> Creating Ec2 instance . </span>

```
Launch an instance
 - Name and tags -> deployment server
 - AMI -> Ubuntu Server 20.04 LTS
 - Instance Type -> t2.micro
 - Key pair (login) -> code-deploy.pem
 - Network settings -> default setting -> Allow Https Traffic from the internet
 - proceed to launch the instance 
```

2. <span style="color:teal"> Attaching Iam Policy to the instance . </span>

```
- select Django Server instance -> Actions -> Security -> Modify IAM Role ->IAM role -> ec2-code-deploy-s3

- Update Iam role
- Reboot instance to make this role effective

```
3. <span style="color:teal"> Install Code Deploy Agent and setting up the machine in the Machine for docker deploymnet . </span>

```
- connect to ec2 instance "deployment server" using ssh or ec2 connect.
- run the following commands 

    we can bootstrap these scripts into user-data also or run manuel.

        sudo apt update -y 
        echo "adding node package libs"
        # adding node package lib 
        sudo apt install curl ca-certificates gnupg
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install software-properties-common
        sudo add-apt-repository "deb https://deb.nodesource.com/node_16.x $(lsb_release -cs) main" -y 
        sudo apt update
        echo "installing nodejs \n wget \n ruby-full"
        sudo apt install -y nodejs wget ruby-full
        wget https://aws-codedeploy-us-west-2.s3.us-west-2.amazonaws.com/latest/install
        sudo chmod +x ./install
        # logging the output of the installation to /tmp/logfile file.
        sudo ./install auto > /tmp/logfile
        # to check if the agent is running 
        sudo service codedeploy-agent status 

        # installing docker and docker compose
        sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
        sudo apt update
        apt-cache policy docker-ce 
        sudo apt install docker-ce -y
        # sudo systemctl status docker
        sudo usermod -aG docker ${USER}
        sudo chown $USER:$USER /var/run/docker.sock
        # su - ${USER}
        id -nG
```
