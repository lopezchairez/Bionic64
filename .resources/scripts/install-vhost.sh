#!/usr/bin/env bash

wget -O virtualhost https://raw.githubusercontent.com/RoverWire/virtualhost/master/virtualhost.sh

sed -i "s/.*Options Indexes FollowSymLinks MultiViews.*//" virtualhost
sed -i '77s/<Directory \/>//' virtualhost
sed -i '78s/AllowOverride All//' virtualhost
sed -i '79s/<\/Directory>//' virtualhost

chmod +x virtualhost && mv virtualhost /usr/local/bin
