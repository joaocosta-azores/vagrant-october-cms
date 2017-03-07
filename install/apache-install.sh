#!/bin/bash

# Install and configure Apache
echo ===============================================================
echo ============== APACHE INSTALL =================================
echo ===============================================================
apt-get -y install apache2
apache2ctl configtest
systemctl restart apache2
ufw app list
ufw app info "Apache Full"
ufw allow in "Apache Full"
a2enmod rewrite

# Configure vhost
echo ===============================================================
echo ============== VHOSTS =========================================
echo ===============================================================
cat <<EOT >> /etc/apache2/sites-available/$PROJECT.conf
<VirtualHost *:80>
    ServerAdmin $EMAIL
    ServerName $GUEST_HOSTNAME

    DocumentRoot "/var/www/$PROJECT/public"
    <Directory "/var/www/$PROJECT/public">
        AllowOverride All
    </Directory>
</VirtualHost>
EOT

ln -s /etc/apache2/sites-available/$PROJECT.conf /etc/apache2/sites-enabled/$PROJECT.conf
rm /etc/apache2/sites-enabled/000-default.conf
systemctl restart apache2
systemctl status apache2
