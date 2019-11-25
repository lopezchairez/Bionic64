#!/usr/bin/env bash

cat > $HOME/.bash_aliases << EOF
# navigation
alias ..="cd .."
alias ...="cd ../.."

# phinx
alias px:create="php ./vendor/bin/phinx create"
alias px:migrate="php ./vendor/bin/phinx migrate"
alias px:rollback="php ./vendor/bin/phinx rollback"
alias px:reset="php ./vendor/bin/phinx rollback -t 0"

# beanstalkd
alias bs:start="sudo service beanstalkd start"
alias bs:restart="sudo service beanstalkd restart"
alias bs:stop="sudo service beanstalkd stop"
alias bs:status="sudo service beanstalkd status"
alias bs:login="telnet localhost 11300"

# supervisor
alias sv:start="sudo service supervisor start"
alias sv:restart="sudo service supervisor restart"
alias sv:stop="sudo service supervisor stop"
alias sv:status="sudo service supervisor status"
alias sv:reread="sudo supervisorctl reread"
alias sv:update="sudo supervisorctl update"
alias sv:process="sudo supervisorctl status"

# phpunit
alias pu="vendor/bin/phpunit"
alias puf="vendor/bin/phpunit --filter"

# mysql database import
function dbimport() { 
  pv \$1 --progress --eta | zcat | mysql -uroot -proot \$2
}

# php versions
function php56() {
  sudo update-alternatives --set php /usr/bin/php5.6
  sudo a2dismod php5.6 php7.0 php7.1 php7.2 php7.3
  sudo a2enmod php5.6
  sudo service apache2 restart
}

function php70() {
  sudo update-alternatives --set php /usr/bin/php7.0
  sudo a2dismod php5.6 php7.0 php7.1 php7.2 php7.3
  sudo a2enmod php7.0
  sudo service apache2 restart
}

function php71() {
  sudo update-alternatives --set php /usr/bin/php7.1
  sudo a2dismod php5.6 php7.0 php7.1 php7.2 php7.3
  sudo a2enmod php7.1
  sudo service apache2 restart
}

function php72() {
  sudo update-alternatives --set php /usr/bin/php7.2
  sudo a2dismod php5.6 php7.0 php7.1 php7.2 php7.3
  sudo a2enmod php7.2
  sudo service apache2 restart
}

function php73() {
  sudo update-alternatives --set php /usr/bin/php7.3
  sudo a2dismod php5.6 php7.0 php7.1 php7.2 php7.3
  sudo a2enmod php7.3
  sudo service apache2 restart
}
EOF

chown vagrant:vagrant $HOME/.bash_aliases
