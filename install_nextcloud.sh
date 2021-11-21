#!/bin/bash

# Check if Debain is installed.  If it is, install the php repositories
if grep -q Debian "/etc/os-release" ; then
	echo "Debian is installed"
	echo
	echo "Installing Debian prerequisites"
	echo
	sudo apt update
	sudo apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
	wget https://packages.sury.org/php/apt.gpg
	sudo apt-key add apt.gpg
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list
else
	echo "Not Debian...continuing"
fi

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
