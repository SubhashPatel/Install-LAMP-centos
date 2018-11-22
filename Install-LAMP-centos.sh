#!/bin/sh

#######################################
# Bash script to install an LAMP stack in ubuntu
# Author: Subhash (serverkaka.com)

## Install APache
yum install -y httpd
systemctl start httpd

## Set apache autostart at system reboot
sudo systemctl enable httpd

## Allow Apache via Firewall
firewall-cmd --permanent --add-service=http
systemctl restart firewalld

## Install PHP
yum install php php-mysql php-pdo php-gd php-mbstring -y

## Install MySql
sudo wget -N http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
sudo yum localinstall -y mysql-community-release-el7-5.noarch.rpm
sudo yum install -y mysql-community-server
sudo systemctl start mysqld

## Set apache autostart at system reboot
sudo systemctl enable mysqld
