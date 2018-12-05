#!/bin/sh

#######################################
# Bash script to uninstall an LAMP stack in CentOS
# Author: Subhash (serverkaka.com)

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Uninstall APache
systemctl stop httpd
yum remove -y httpd

# Uninstal PHP
yum remove php php-mysql php-pdo php-gd php-mbstring -y

# Uninstall MySql
systemctl stop mysqld.service && yum remove -y mysql-community-server && rm -rf /var/lib/mysql && rm -rf /var/log/mysqld.log && rm -rf /etc/my.cnf

# Uninstall PhpMyAdmin
yum remove -y epel-release
sudo remove -y install phpmyadmin

# Clean File
yum -y autoremove

echo LAMP server uninstallation completed.
