#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password root"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password root"

apt-get install -y mysql-server-5.7

sed -i "s/max_allowed_packet.*/max_allowed_packet      = 512M/" /etc/mysql/mysql.conf.d/mysqld.cnf

echo "sql_mode = NO_ENGINE_SUBSTITUTION,ALLOW_INVALID_DATES" >> /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

mysql --user=root --password=root <<_EOF_
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';

FLUSH PRIVILEGES;
_EOF_
