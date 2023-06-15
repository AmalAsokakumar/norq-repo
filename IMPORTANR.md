## this is how i downloaded a file for remote machine to my local machine.

```
scp -i aws-gps-backend-key.pem ubuntu@52.23.119.139:/home/ubuntu/log.txt ~
```

## one another way is to run a python server

```
python -m http.server

python3 -m  http.server
```

## Gps server (master)

Pem key : 1.
Password : admin

```
ssh-keygen -t ed25519 -f ./gps_backend -N "admin" < /dev/null
```

### Rename the private key(key without any extinction) with .pem extenction. 

```
Ssh-keygen -b 4096 -f gps_qa 
```

-	 here one the generated keys, the public key will be copied to the ec2 instance and private key ( key without any extinctions will be) will be rename with .pem extenction ad used as a pem key. 
	

### Default permission for pem.key is 600

```
 chmod 600 pemkey.
```
```
ssh-keygen -b 2048 -t rsa
```

#### I have fixed the issue with the ssh key. 

```
sudo ssh-keygen -f "/var/root/.ssh/known_hosts" -R  "ec2-52-23-119-139.compute-1.amazonaws.com"
```

- Path of the of known hosts would be varied based on operating system
- For mac this was the path 

#### For kali this path would be like 

```
/root/.ssh/known_hosts". 
```