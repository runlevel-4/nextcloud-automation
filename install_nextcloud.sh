#!/bin/bash

#Perform updates
sudo apt update && sudo apt upgrade -y

#Install web components
sudo apt install apache2 mariadb-common mariadb-server php7.4 php7.4-mysql php7.4-zip php7.4-xml php7.4-curl php7.4-mb* php7.4-gd php7.4-dom -y
sudo cp $HOME/nextcloud-automation/setup-nextcloud.php /var/www/html
sudo chown -R www-data: /var/www/html/

# Configuring database environment
echo
echo "If you don't have a root password for your MySQL instance, just press Enter:"
sudo mysql -u root -p < $HOME/nextcloud-automation/mysql_setup.sql
sudo systemctl restart apache2
echo
echo "Now visit http://ServerIP/setup-nextcloud.php"
