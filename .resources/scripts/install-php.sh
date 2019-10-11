#!/usr/bin/env bash

add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get install -y unzip php5.6 \
	php5.6-bcmath \
	php5.6-curl \
	php5.6-gd \
	php5.6-mbstring \
	php5.6-mcrypt \
	php5.6-mysql \
	php5.6-sqlite3 \
	php5.6-xml \
	php5.6-zip

sed -i "s/error_reporting = .*/error_reporting = E_ALL \\& ~E_DEPRECATED/" /etc/php/5.6/cli/php.ini
sed -i "s/error_reporting = .*/error_reporting = E_ALL \\& ~E_DEPRECATED/" /etc/php/5.6/apache2/php.ini

sed -i "s/display_errors = .*/display_errors = On/" /etc/php/5.6/cli/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/5.6/apache2/php.ini

sed -i "s/short_open_tag = .*/short_open_tag = On/" /etc/php/5.6/cli/php.ini
sed -i "s/short_open_tag = .*/short_open_tag = On/" /etc/php/5.6/apache2/php.ini

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
apt-get install -y php-memcached php-xdebug
