#!/bin/bash

# Install MariaDB 10.2
# https://downloads.mariadb.org/mariadb/repositories/#mirror=fe_up_pt&version=10.2
apt-get install software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirrors.fe.up.pt/pub/mariadb/repo/10.2/ubuntu xenial main'
apt -y update
apt -y install mariadb-server mariadb-client
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

