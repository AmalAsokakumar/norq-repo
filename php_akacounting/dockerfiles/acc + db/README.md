# to build

```
docker build -t akaunting-image .
```

# script to run the image.

```
docker run -d --name akaunting-container -p 80:80 akaunting-image

```

`
Account details: 
 database akaunting
 user : accountant
 host : localhost 
 password : your-password
`