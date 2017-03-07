#!/bin/bash

# Ubuntu 16.04 LAMP installer
# Optimized for Laravel 5.4


###################################
# No need to edit under this line #
###################################

echo ===============================================================
echo ============== LAMP INSTALL - $PROJECT ========================
echo ===============================================================

# Refresh package index
sudo apt-get update -y






## Install Node.js and npm
#echo ===============================================================
#echo ============== NODE.JS AND NPM INSTALL ========================
#echo ===============================================================
#curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
#bash install_nvm.sh
#echo "source $VAGRANT_HOME/.nvm/nvm.sh" >> $VAGRANT_HOME/.profile
#source $VAGRANT_HOME/.profile
#nvm install 6.0.0

# Configure git
#sudo git config --global core.editor vim

# Install Laravel
#echo ===============================================================
#echo ============== LARAVEL INSTALL ================================
#echo ===============================================================
#composer global require "laravel/installer"

# Add Laravel to PATH
#sudo echo "export PATH=$PATH:$HOME/.config/composer/vendor/bin" >> ~/.profile
#sudo echo "PATH=$PATH:$HOME/.composer/vendor/laravel/installer" >> ~/.profile
#sudo source ~/.profile

# Create new Laravel app
#echo ===============================================================
#echo ============== LARAVEL APP INSTALL ============================
#echo ===============================================================
#sudo composer create-project --prefer-dist laravel/laravel /var/www/app
#sudo laravel new /var/www/app
#sudo mv /var/www/app/* $GUEST_DIRECTORY
#sudo mv /var/www/app/.* $GUEST_DIRECTORY

# Configure app
#echo ===============================================================
#echo ============== LARAVEL APP CONFIG =============================
#echo ===============================================================

# Configure Laravel app's permissions
#sudo chgrp -R www-data $GUEST_DIRECTORY/storage $GUEST_DIRECTORY/bootstrap/cache
#sudo chmod -R ug+rwx $GUEST_DIRECTORY/storage $GUEST_DIRECTORY/bootstrap/cache

# Install front end tools
#cd $GUEST_DIRECTORY
#sudo npm install
#sudo npm run dev

# Run DB migrations
#php artisan migrate

#sudo composer clear-cache -d $GUEST_DIRECTORY
#sudo composer update -d $GUEST_DIRECTORY
#sudo composer install -d $GUEST_DIRECTORY

# Configure app's .env file
#cat <<EOT >> $GUEST_DIRECTORY/.env
#APP_ENV=development
#APP_KEY=base64:MrsNlt8fGSnCmrWU122BtjgFxsIVumOqFCCAf9I2MJQ=
#APP_DEBUG=true
#APP_LOG_LEVEL=debug
#APP_URL=http://$PROJECT.dev
#
#DB_CONNECTION=mysql
#DB_HOST=127.0.0.1
#DB_PORT=3306
#DB_DATABASE=$MYSQL_DB_NAME
#DB_USERNAME=$MYSQL_USER
#DB_MYSQL_PASSWORD=$MYSQL_PASSWORD
#
#BROADCAST_DRIVER=log
#CACHE_DRIVER=file
#SESSION_DRIVER=file
#QUEUE_DRIVER=sync
#
#REDIS_HOST=127.0.0.1
#REDIS_MYSQL_PASSWORD=null
#REDIS_PORT=6379
#
#MAIL_DRIVER=smtp
#MAIL_HOST=mailtrap.io
#MAIL_PORT=2525
#MAIL_USERNAME=null
#MAIL_MYSQL_PASSWORD=null
#MAIL_ENCRYPTION=null
#
#PUSHER_APP_ID=
#PUSHER_KEY=
#PUSHER_SECRET=
#EOT
#

#sudo git clone https://github.com/laravel/laravel.git
#sudo mv laravel/* .
#sudo mv laravel/.* .
#sudo rm -rf laravel

