#!/usr/bin/env bash

add-apt-repository -y ppa:ondrej/php
apt-get update

VERSIONS=("5.6" "7.4")

for VERSION in "${VERSIONS[@]}"
do
	apt-get install -y \
		"php${VERSION}" \
		"php${VERSION}-bcmath" \
		"php${VERSION}-curl" \
		"php${VERSION}-gd" \
		"php${VERSION}-mbstring" \
		"php${VERSION}-mysql" \
		"php${VERSION}-sqlite3" \
		"php${VERSION}-xml" \
		"php${VERSION}-zip"

	sed -i "s/error_reporting = .*/error_reporting = E_ALL \\& ~E_DEPRECATED/" "/etc/php/${VERSION}/cli/php.ini"
	sed -i "s/error_reporting = .*/error_reporting = E_ALL \\& ~E_DEPRECATED/" "/etc/php/${VERSION}/apache2/php.ini"

	sed -i "s/display_errors = .*/display_errors = On/" "/etc/php/${VERSION}/cli/php.ini"
	sed -i "s/display_errors = .*/display_errors = On/" "/etc/php/${VERSION}/apache2/php.ini"

	sed -i "s/short_open_tag = .*/short_open_tag = On/" "/etc/php/${VERSION}/cli/php.ini"
	sed -i "s/short_open_tag = .*/short_open_tag = On/" "/etc/php/${VERSION}/apache2/php.ini"
done

apt-get install -y php-memcached
update-alternatives --set php /usr/bin/php5.6

a2dismod php5.6 php7.4
a2enmod php5.6
service apache2 restart

COMPOSER_FILE=/usr/local/bin/composer
if [ ! -f "$COMPOSER_FILE" ]; then
	curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi

