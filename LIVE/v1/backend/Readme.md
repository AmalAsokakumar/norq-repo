# the file permission needed on ec2 

```
sudo chown -R jenkins /home/ubuntu/
sudo chmod -R u+rwx /home/ubuntu/
sudo chmod -R 755 /home/ubuntu
sudo chown -R jenkins:jenkins /home/ubuntu/
sudo service jenkins restart
```

# to view the product 
```
sudo lsof -i -P -n
```


To run your Node.js application in the background on a production server and keep it running even when the terminal is closed, you can use a process manager like PM2. PM2 provides a robust set of features for managing Node.js applications, including running them as background processes, monitoring, and automatic restarts.

Here are the steps to use PM2 to run your Node.js application in the background:

1. Install PM2 globally by running the following command:

   ```r
   npm install -g pm2
   ```

2. Change to your application's directory:

   ```r
   cd /path/to/your/node_app
   ```

3. Start your application using PM2:

   ```r
   pm2 start npm --name "your-app-name" -- start
   ```
   Replace `"your-app-name"` with a suitable name for your application.

   The above command uses the `npm` command to start your application. If your application has a different startup script, replace `"start"` with the appropriate command or script.

4. Verify that your application is running:
   ```r
   pm2 list
   ```
   This command will display a list of processes managed by PM2, including your application.

5. You can now close the terminal, and your Node.js application will continue running in the background.

PM2 also provides other useful commands to manage your application, such as stopping, restarting, or monitoring. You can refer to the PM2 documentation for more information on managing your application using PM2.

Note: It is recommended to set up PM2 to start automatically on system boot so that your application starts automatically after server restarts. You can refer to the PM2 documentation for instructions on how to set up PM2 as a startup service.

By using PM2 to manage your Node.js application, you can ensure its stability and availability in a production environment.


# files modified. 