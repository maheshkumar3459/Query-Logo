# Query-Logo
This Simple bash script will query the redis key &amp; value which fetches the logo from MySQL database.


This script accepts two parameters.
 1) MySQL admin password to run query on the database
 2) User input Y/N for Installation of Redis-server and MySQL server on the Ubuntu OS 

REDIS:
Redis config and service file are attached with this script. This script will copy the config files to respective directories. 
Redis Server will start on the port 9000

MySQL:
This script accepts the admin password on the console inorder to run the query. 

Admin password will be copied in ~/.my.cnf file. 

Script Usage: Copy the config folder and script on the same folder. 
              chmod +x query_logo.sh
              ./query_logo.sh 
              
First Output of the script: 
![image](https://user-images.githubusercontent.com/88964909/129473336-395abd29-96bb-47ab-9ef9-11ee1cd71f98.png)

Replacing W with (
![image](https://user-images.githubusercontent.com/88964909/129473370-0aed3e33-ebc0-4754-a015-ab8fbb8bbb47.png)

