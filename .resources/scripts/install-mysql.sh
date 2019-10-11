#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password root"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password root"

apt-get install -y python libaio1

wget https://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-server_5.6.44-1ubuntu14.04_amd64.deb-bundle.tar
tar -xf mysql-server_5.6.44-1ubuntu14.04_amd64.deb-bundle.tar

dpkg -i mysql-client_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-community-server_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-server_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-community-source_5.6.44-1ubuntu14.04_amd64.deb \
	libmysqlclient18_5.6.44-1ubuntu14.04_amd64.deb \
	libmysqlclient-dev_5.6.44-1ubuntu14.04_amd64.deb \
	libmysqld-dev_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-community-client_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-community-bench_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-common_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-community-test_5.6.44-1ubuntu14.04_amd64.deb \
	mysql-testsuite_5.6.44-1ubuntu14.04_amd64.deb

echo "max_allowed_packet=512M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart

mysql -uroot -proot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"
