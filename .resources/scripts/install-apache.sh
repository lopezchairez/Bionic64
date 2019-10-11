#!/usr/bin/env bash

add-apt-repository -y ppa:ondrej/apache2
apt-get update

apt-get install -y apache2
a2enmod rewrite

sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
service apache2 restart
