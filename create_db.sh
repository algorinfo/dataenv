#!/bin/bash
#PASS=`pwgen -s 40 1`
# DATA to be created
DBNAME=$1
USERNEW=$2
PASSNEW=$3

echo "Give me a user:"
read USER

echo "Give me a pass:"
read PASS

echo "Give me a server:"
read SERVER


mysql -u${USER} -h $SERVER -p$PASS <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $DBNAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER '$USERNEW'@'localhost' IDENTIFIED BY '$PASSNEW';
CREATE USER '$USERNEW'@'%' IDENTIFIED BY '$PASSNEW';
GRANT ALL PRIVILEGES ON $DBNAME.* TO '$USERNEW'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL db $DBNAME created"
