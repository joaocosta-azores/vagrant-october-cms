#!/bin/bash

# Install Laravel
echo ===============================================================
echo ============== LARAVEL INSTALL ================================
echo ===============================================================
sudo composer global require "laravel/installer"

# Add Laravel to PATH
#sudo echo "export PATH=$PATH:$HOME/.config/composer/vendor/bin" >> ~/.profile
#sudo echo "PATH=$PATH:$HOME/.composer/vendor/laravel/installer" >> ~/.profile
#sudo source ~/.profile

# Create new Laravel app
echo ===============================================================
echo ============== LARAVEL APP INSTALL ============================
echo ===============================================================
#sudo composer create-project --prefer-dist laravel/laravel /var/www/app
cd /var/www

sudo laravel new app
#sudo chown -R vagrant /var/www/app

sudo mv /var/www/app/* $GUEST_DIRECTORY
sudo mv /var/www/app/.* $GUEST_DIRECTORY

# Configure app
echo ===============================================================
echo ============== LARAVEL APP CONFIG =============================
echo ===============================================================

# Configure Laravel app's permissions
jsudo chgrp -R www-data $GUEST_DIRECTORY/storage $GUEST_DIRECTORY/bootstrap/cache
sudo chmod -R ug+rwx $GUEST_DIRECTORY/storage $GUEST_DIRECTORY/bootstrap/cache

# Install dependencies & front end tools
cd $GUEST_DIRECTORY
echo "Installing composer dependencies... "
sudo composer update
echo "Installing npm dependencies... "
sudo npm install
sudo npm run dev

# Configure app's .env file
cat <<EOT >> $GUEST_DIRECTORY/.env
APP_ENV=development
APP_KEY=
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://$PROJECT.dev

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=$MYSQL_DB_NAME
DB_USERNAME=$MYSQL_USER
DB_MYSQL_PASSWORD=

BROADCAST_DRIVER=log
CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync

REDIS_HOST=127.0.0.1
REDIS_MYSQL_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_MYSQL_PASSWORD=null
MAIL_ENCRYPTION=null

PUSHER_APP_ID=
PUSHER_KEY=
PUSHER_SECRET=
EOT

php artisan key:generate

# Run DB migrations
php artisan migrate
