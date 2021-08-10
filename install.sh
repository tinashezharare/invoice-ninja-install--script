#!/bin/bash

#wget -O invoice-ninja.zip https://download.invoiceninja.com/
wget -O invoice-ninja.zip https://github.com/invoiceninja/invoiceninja/releases/download/v5.2.17/invoiceninja.zip
sudo apt install unzip

sudo mkdir -p /var/www/invoice-ninja

sudo unzip invoice-ninja.zip -d /var/www/invoice-ninja
sudo chown www-data:www-data /var/www/invoice-ninja/ -R
sudo chmod 755 /var/www/invoice-ninja/storage/ -R


cat > /etc/apache2/sites-available/invoice-ninja.conf << 'EOL'
<VirtualHost *:80>
    ServerName invoice.yourdomain.com
    DocumentRoot /var/www/invoice-ninja/public

    <Directory /var/www/invoice-ninja/public>
       DirectoryIndex index.php
       Options +FollowSymLinks
       AllowOverride All
       Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/invoice-ninja.error.log
    CustomLog ${APACHE_LOG_DIR}/invoice-ninja.access.log combined

#    Include /etc/apache2/conf-available/php7.3-fpm.conf
</VirtualHost>
EOL

sudo a2ensite invoice-ninja.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
