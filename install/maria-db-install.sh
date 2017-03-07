#!/bin/bash

apt-get -y install mariadb-server mariadb-client
systemctl status mysql
systemctl enable mysql

# Allow incoming connections (i.e. sequel pro)
sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Configure root user
mysql -u root -e "DROP USER 'root'@'localhost';
CREATE USER 'root'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES"

# Create DB
mysql -u root -e "CREATE DATABASE $MYSQL_DB_NAME"

