#!/usr/bin/env bash

ZEND_PATH=/usr/share/php/zend-framework-1.11.11

if [ ! -d "$ZEND_PATH" ]; then

	wget https://packages.zendframework.com/releases/ZendFramework-1.11.11/ZendFramework-1.11.11-minimal.tar.gz
	tar -xpzf ZendFramework-1.11.11-minimal.tar.gz	

	mkdir /usr/share/php
	mv ZendFramework-1.11.11-minimal /usr/share/php/zend-framework-1.11.11

	ln -s /usr/share/php/zend-framework-1.11.11/bin/zf.sh /usr/bin/zf
fi

VERSIONS=("5.6" "7.0" "7.1" "7.2" "7.3")

for VERSION in "${VERSIONS[@]}"
do
	sed -i 's@;include_path = ".:/usr/share/php"@include_path = ".:/usr/share/php/zend-framework-1.11.11/library"@' "/etc/php/${VERSION}/cli/php.ini"
	sed -i 's@;include_path = ".:/usr/share/php"@include_path = ".:/usr/share/php/zend-framework-1.11.11/library"@' "/etc/php/${VERSION}/apache2/php.ini"
done

service apache2 restart
