#!/usr/bin/env bash

apt-get update

echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

apt-get install -y build-essential software-properties-common
apt-get install -y pv vim curl wget tree unzip git-core

apt-get install -y imagemagick memcached beanstalkd supervisor sqlite3
