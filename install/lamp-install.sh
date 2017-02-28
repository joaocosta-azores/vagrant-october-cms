#!/bin/bash

# Ubuntu 16.04 LAMP installer
# Optimized for Laravel 5.4

PROJECT='dream-invoice'
PROJECT_DIR="/var/www/$PROJECT"
PASSWORD='password'
MYSQLDB='di'
MYSQLUSER='root'
SERVERNAME='dream-invoice.dev'
EMAIL='freddy@freddyduarte.com'

# Refresh package index
sudo apt-get update

# Install and configure Apache
sudo apt-get -y install apache2
sudo apache2ctl configtest
sudo systemctl restart apache2
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow in "Apache Full"
sudo a2enmod rewrite

# Configure vhost
cat <<EOT >> /etc/apache2/sites-available/$PROJECT.conf
<VirtualHost *:80>
    ServerAdmin $EMAIL
    ServerName $SERVERNAME

    DocumentRoot "/var/www/$PROJECT/public"
    <Directory "/var/www/$PROJECT/public">
        AllowOverride All
    </Directory>
</VirtualHost>
EOT

sudo ln -s /etc/apache2/sites-available/$PROJECT.conf /etc/apache2/sites-enabled/$PROJECT.conf
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo systemctl restart apache2
sudo systemctl status apache2

# Install MySQL
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server mysql-client

# Create DB 
mysql -u root -p$PASSWORD -e "create database $MYSQLDB"

# Install PHP
sudo apt-get -y install php libapache2-mod-php php-mcrypt php-mysql php7.0-zip php7.0-mbstring php-xml

# Install composer
sudo apt -y install composer

# Install Node.js and npm
sudo apt-get install nodejs
sudo apt-get install npm

# Installing multitail
sudo apt -y install multitail

# Configure git
git config --global core.editor vim

# Configure app
cd $PROJECT_DIR

# Configure app's .env file
cat <<EOT >> $PROJECT_DIR/.env
APP_ENV=development
APP_KEY=base64:MrsNlt8fGSnCmrWU122BtjgFxsIVumOqFCCAf9I2MJQ=
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://$PROJECT.dev

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=$MYSQLDB
DB_USERNAME=$MYSQLUSER
DB_PASSWORD=$PASSWORD

BROADCAST_DRIVER=log
CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null

PUSHER_APP_ID=
PUSHER_KEY=
PUSHER_SECRET=
EOT

# Install Laravel
sudo composer global require "laravel/installer"

# Add Laravel to PATH
sudo echo "export PATH=$PATH:$HOME/.config/composer/vendor/bin" >> ~/.profile
sudo source ~/.profile

# Pull lattest Laravel
sudo git clone https://github.com/laravel/laravel.git
sudo mv laravel/* .
sudo mv laravel/.* .
sudo rm -rf laravel

# Configure Laravel app's permissions
sudo chgrp -R www-data $PROJECT_DIR/storage $PROJECT_DIR/bootstrap/cache
sudo chmod -R ug+rwx $PROJECT_DIR/storage $PROJECT_DIR/bootstrap/cache

#sudo composer clear-cache -d $PROJECT_DIR
#sudo composer update -d $PROJECT_DIR
sudo composer install -d $PROJECT_DIR

# Run DB migrations
sudo php artisan migrate

echo ===============================================================
echo ========= FINISHED INSTALLATION ===============================
echo ===============================================================
