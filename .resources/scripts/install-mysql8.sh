#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password root"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password root"

wget https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb
dpkg -i mysql-apt-config_0.8.16-1_all.deb

apt-get update
apt-get install -y mysql-server

tee -a /etc/mysql/mysql.conf.d/mysqld.cnf > /dev/null << END

character-set-server = utf8
collation-server = utf8_unicode_ci
default_authentication_plugin = mysql_native_password
max_allowed_packet = 512M
sql_mode = NO_ENGINE_SUBSTITUTION,ALLOW_INVALID_DATES

END

systemctl restart mysql

mysql --user=root --password=root <<_EOF_
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';

FLUSH PRIVILEGES;
_EOF_
