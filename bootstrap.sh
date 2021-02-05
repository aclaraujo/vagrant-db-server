#!/usr/bin/env bash

DBHOST=localhost
DBNAME1=dbstg
DBNAME2=dbdw
DBUSER=dbuser
DBPASSWD=password
PDI_VERSION=9.1
PDI_BUILD=9.1.0.0-324

sudo apt-get update
sudo apt-get install vim curl build-essential python-software-properties git

debconf-set-selections <<< "mariadb-server mariadb-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mariadb-server mariadb-server/root_password_again password $DBPASSWD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"

# install mysql and admin interface

#apt-get -y install mysql-server phpmyadmin
sudo apt-get --assume-yes install mariadb-server phpmyadmin

mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME1"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME1.* to '$DBUSER'@'%' identified by '$DBPASSWD'"

mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME2"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME2.* to '$DBUSER'@'%' identified by '$DBPASSWD'"

sudo mysql dbstg < /vagrant/source/dbstg.sql
sudo mysql dbdw < /vagrant/source/dbdw.sql
sudo mysql dbdw < /vagrant/source/dim_comp_insert.sql

cd /vagrant

# update mysql conf file to allow remote access to the db

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
#sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/conf.d/mysql.cnf

sudo service mysql restart

# setup phpmyadmin

sudo apt-get -y install php apache2 libapache2-mod-php php-curl php-gd php-mysql php-gettext #a2enmod rewrite

sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

rm -rf /var/www/html
ln -fs /vagrant/public /var/www/html

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini

service apache2 restart

#pentaho

sudo apt-get -y install unzip

sudo apt-get -y install openjdk-8-jdk
	
wget -N --progress=dot:giga http://downloads.sourceforge.net/project/pentaho/Pentaho%20${PDI_VERSION}/client-tools/pdi-ce-${PDI_BUILD}.zip

mkdir -p /home/vagrant/pentaho/

unzip -u -d /home/vagrant/pentaho/ pdi-ce-${PDI_BUILD}.zip

mkdir -p /home/vagrant/.kettle/
cp -f repositories.xml kettle.properties /home/vagrant/.kettle/

mkdir -p /home/vagrant/pentaho/jobs
cp -f jobs/* /home/vagrant/pentaho/jobs/

mkdir -p /home/vagrant/arquivos/
cp -f arquivos/* /home/vagrant/arquivos/

cp -f lib/mariadb* /home/vagrant/pentaho/data-integration/lib/

cp Pentaho\ Data\ Integration.desktop /home/vagrant/Desktop/

sudo chown -R vagrant:vagrant /home/vagrant/* /home/vagrant/.kettle

# instalar o display manager e a graphic interface 

sudo apt-get -y install libwebkitgtk-1.0-0

sudo apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

sudo apt-get -y install xfce4 slim