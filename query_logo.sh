#!/bin/bash

###########################################################################################
#       Script Name          : query_logo.sh                                              #
#       Author               : Mahesh Kumar Jeyaraj                                       #
#       Data created         : 15/08/2021                                                 #
#       Description          : This Script helps to query the mysql database and retrieve #
#                              data Redis to print the logo on the console.               #
#                                                                                         #
#                              This script accepts two parameters.                        #
#                               1) MySQL admin password to run query on the database      #
#                               2) User input Y/N for Installation of Redis-server and    #
#                                  MySQL server on the Ubuntu OS                          #
#                                                                                         #
#       Script Usage         : chmod +x query_logo.sh                                     #
#                              ./query_logo.sh                                            #
#                                                                                         #
###########################################################################################

#Copy Redis Config to run on port 9000
copyRedisConfig(){
        echo -e "Copying Redis Configuration...\n"
        sudo mkdir -p /etc/redis

        sudo cp ./config/*.conf /etc/redis/redis.conf
        sudo cp ./config/*.service /etc/systemd/system/redis.service
}

#Set MySQL admin password on ~/.my.cnf
setMySQLConfig() {
        credentialsFile=~/.my.cnf
        echo "[client]" > $credentialsFile
        echo "user=root" >> $credentialsFile
        echo "password=$var" >> $credentialsFile
}

#Install Redis server using lastest stable version
installRedis() {
        echo -e "Redis Server Installation...\n"
        set +x
        sudo apt-get update > /dev/null

        cd /tmp
        curl -s -O http://download.redis.io/redis-stable.tar.gz
        tar xzf redis-stable.tar.gz

        cd redis-stable
        sudo make install > /dev/null

        sudo adduser --system --group --no-create-home redis
        sudo mkdir -p /var/lib/redis
        sudo chown redis:redis /var/lib/redis
        sudo chmod 770 /var/lib/redis
        echo -e "Redis Server Installation COMPLETE.\n"
}

#Start Redis Server on port 9000
startRedis() {
        echo -e "Redis Server Starting In-Progress...\n"
        response=$(redis-cli -h 127.0.0.1 -p 9000 ping)
        if [ "$response" = "PONG" ];then
                echo -e "Redis is already UP...\n"
        else
                echo -e "Redis server is not up. Starting Redis Server...\n"
                sudo systemctl start redis
                sleep 10
        fi

}

#Test Redis Server on port 9000 using PING
testRedis() {
        echo -e "Test Redis Server In-Progress...\n"
        response=$(redis-cli -h 127.0.0.1 -p 9000 ping)
        if [ "$response" != "PONG" ];then
                echo -e "Redis server is not UP. This will take time to restart the Redis server...\n\n"
                sudo systemctl restart redis
                sleep 10
                testRedis
        else
                echo -e "Redis is UP and running \n\n"
        fi

        echo -e "Redis Server Startup COMPLETE.\n\n"
}

#Imstall MySQL-server on ubuntuOS
installMySQL() {
        echo -e "MySQL Installation...\n"
        echo "mysql-server mysql-server/root_password password ${var}" | sudo debconf-set-selections
        echo "mysql-server mysql-server/root_password_again password ${var}" | sudo debconf-set-selections

        sudo apt-get install --assume-yes mysql-server > /dev/null
        echo -e "MYSQL Installation COMPLETE.\n"
}

#Create database data and Import the logo sql on to the database /home/vagrant/data/logo.sql
createImportMySQLDB() {
        echo -e "Creating data database & Import Data In-Progress...\n"
        mysql -u root -e "Create database if not exists data"
        if [ "$?" = 0 ]; then
                echo -e "Database DATA created successfully\n\n"
        else
                echo -e "Database not created\n\n"
                exit 1
        fi

        mysql -u root -D data < /home/vagrant/data/logo.sql
        if [ "$?" = 0 ]; then
                echo -e "Logo SQL file Imported successfully\n\n"
        else
                echo -e "Logo SQL file Imported successfully\n\n"
                exit 1
        fi
        echo -e "Create & Import data database COMPLETE.\n"
}

#Fetch 10 rows in MySQL Database and Query the Redis keys and values to create logo on the console output
fetchQueryRedis() {
        echo -e "Fetching 10 rows from MySQL Database \n"
        mysql -u root -D data -e "select * from logo LIMIT 10"

        echo -e "\n Fetch KEY and Value starts with ROW_* from REDIS \n"
        keys=`redis-cli -p 9000 keys 'ROW_*'|sort -V`
        if [ "$keys" ]; then
                echo "$keys" | while IFS= read -r key; do
                type=`echo | redis-cli -p 9000 type "$key"`
                case "$type" in
                    string) value=`echo | redis-cli -p 9000 get "$key"`;;
                    hash) value=`echo | redis-cli -p 9000 hgetall "$key"`;;
                    set) value=`echo | redis-cli -p 9000 smembers "$key"`;;
                    list) value=`echo | redis-cli -p 9000 lrange "$key" 0 -1`;;
                    zset) value=`echo | redis-cli -p 9000 zrange "$key" 0 -1 withscores`;;
                esac
                mysql -u root -D data -e "select string as '' from logo where id = ${value}"
            done
            echo -e "\n Replacing W with (  \n"
            echo "$keys" | while IFS= read -r key; do
                type=`echo | redis-cli -p 9000 type "$key"`
                case "$type" in
                    string) value=`echo | redis-cli -p 9000 get "$key"`;;
                    hash) value=`echo | redis-cli -p 9000 hgetall "$key"`;;
                    set) value=`echo | redis-cli -p 9000 smembers "$key"`;;
                    list) value=`echo | redis-cli -p 9000 lrange "$key" 0 -1`;;
                    zset) value=`echo | redis-cli -p 9000 zrange "$key" 0 -1 withscores`;;
                esac
                mysql -u root -D data -e "select string as '' from logo where id = ${value}"|sed 's/W/(/g'
            done
        fi
}

#Stop the Redis Server
stopRedis() {
        echo -e "Stopping Redis server In-Progress... This will take time to stop the service...\n"
        sudo systemctl stop redis
        echo -e "Redis server Stopped Successfully...\n"
}

echo -e "\n"
copyRedisConfig
read -s -p "Enter MySQL Root Admin Pasword: " var
setMySQLConfig
echo -e "\n"
read -p "Do you want to install Redis & MySQL Server [Y/y/N/n]: " input

if [ "$input" = "Y" ] || [ "$input" = "y" ]; then
        installRedis
        installMySQL
fi

startRedis
testRedis
createImportMySQLDB
fetchQueryRedis
stopRedis
