#!/usr/bin/env bash


# 
# Init update
# ==============================================

apt-get update


# 
# Apache2
# ==============================================

# Install Apache2
apt-get install -y apache2

# Enabled mod_rewhite
a2enmod rewrite


# 
# PHP and Extensions
# ==============================================

# Install PHP5
apt-get install -y php5

# PHP5 module for Apache 2 web server
apt-get install -y libapache2-mod-php5

# Extensions
apt-get install -y php5-mysqlnd php5-curl php-pear php5-mcrypt

# Enabled mcrypt
php5enmod mcrypt


# 
# Change machine host directory
# ==============================================

rm -rf /var/www/html
mkdir /vagrant/www
ln -fs /vagrant/www /var/www/html


# 
# Default Apache VirtualHost
# ==============================================

VHOST=$(cat <<EOF
NameVirtualHost *:8888
Listen 8888
<VirtualHost *:80>
  DocumentRoot "/var/www/html"
  ServerName localhost
  <Directory "/var/www/html">
      AllowOverride All
    </Directory>
</VirtualHost>
<VirtualHost *:8888>
  DocumentRoot "/var/www/html"
  ServerName localhost
  <Directory "/var/www/html">
      AllowOverride All
    </Directory>
</VirtualHost>
EOF
)

echo "$VHOST" > /etc/apache2/sites-enabled/000-default.conf


# 
# Default apache VirtualHost
# ==============================================

# Ignore the post install questions
export DEBIAN_FRONTEND=noninteractive

# Install MySQL5
apt-get -q -y install mysql-server-5.5

# Set root password for 'root'
mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'"


# 
# phpMyadmin
# ==============================================

# Install phpMyadmin
apt-get -y install phpmyadmin

# Enabled in Apache
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf


# 
# Workflow
# ==============================================

# Git
apt-get install -y git

# Node
apt-get install -y nodejs
apt-get install -y npm

# Dependencies
npm install -g gulp
npm install -g bower


# 
# ZSH
# ==============================================
apt-get install -y zsh
apt-get install -y git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`


# 
# Linux services
# ==============================================

# Unzip
apt-get install -y unzip

# Wget
apt-get install -y wget


# 
# Finish
# ==============================================

# Final apt-get update
apt-get update

# Restart apache service
service apache2 restart

