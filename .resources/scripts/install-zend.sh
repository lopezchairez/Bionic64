#!/usr/bin/env bash

wget https://packages.zendframework.com/releases/ZendFramework-1.11.11/ZendFramework-1.11.11-minimal.tar.gz
tar -xpzf ZendFramework-1.11.11-minimal.tar.gz

mkdir /usr/share/php
mv ZendFramework-1.11.11-minimal /usr/share/php/zend-framework-1.11.11

ln -s /usr/share/php/zend-framework-1.11.11/bin/zf.sh /usr/bin/zf

sed -i 's@;include_path = ".:/usr/share/php"@include_path = ".:/usr/share/php/zend-framework-1.11.11/library"@' /etc/php/5.6/cli/php.ini
sed -i 's@;include_path = ".:/usr/share/php"@include_path = ".:/usr/share/php/zend-framework-1.11.11/library"@' /etc/php/5.6/apache2/php.ini

service apache2 restart
