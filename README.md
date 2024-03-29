# NextCloud Install

============================================================================

1. `git clone https://github.com/runlevel-4/nextcloud-automation`
2. `sh nextcloud-automation/install_nextcloud.sh`

**Default Database Values**

database user: nextcloud

database pass: nextcloud

database name: nextcloud

After clicking _Finish_ at the end of the setup, if you get the **Page not found/cannot connect** error:

Add your server name/ip back to the beginning of the URL and hit _Enter_ to refresh the page.

**NOTE:** I recommend logging into MySQL/MariaDB and changing the password for the _root_ and _nextcloud_ database users.  Do this **only** if you plan on exposing your server to the internet.

`sudo mysql -u root -p` (if you don't have a mysql password, just hit _Enter_)

`ALTER USER 'nextcloud'@'localhost' IDENTIFIED BY 'newpassword';`
