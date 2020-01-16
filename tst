apt-get update
apt-get -y install apt-transport-https wget gnupg
wget -O - https://packages.icinga.com/icinga.key | apt-key add -
. /etc/os-release; if [ ! -z ${UBUNTU_CODENAME+x} ]; then DIST="${UBUNTU_CODENAME}"; else DIST="$(lsb_release -c| awk '{print $2}')"; fi;  echo "deb https://packages.icinga.com/ubuntu icinga-${DIST} main" >  /etc/apt/sources.list.d/${DIST}-icinga.list
apt-get update
apt-get install icinga2
apt-get install monitoring-plugins
systemctl status icinga2
systemctl enable icinga2
icinga2 daemon -C
apt-get install vim-icinga2 vim-addon-manager
vim-addon-manager -w install icinga2
vim ~/.vimrc
vim /etc/icinga2/conf.d/templates.conf
apt-get install mysql-server mysql-client
mysql_secure_installation
apt-get install icinga2-ido-mysql
mysql -u root -p icinga < /usr/share/icinga2-ido-mysql/schema/mysql.sql
vi /etc/icinga2/features-available/ido-mysql.conf
icinga2 feature enable ido-mysql
systemctl restart icinga2
icinga2 feature list
ip a
systemctl status httpd
systemctl status http
ss -tulpn | grep 80
ss -tulpn 
apt-get install -y apt-transport-https curl
curl https://packages.icinga.com/icinga.key | apt-key add -
echo "deb http://packages.icinga.com/ubuntu icinga-$(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/icinga2.list
echo "deb-src http://packages.icinga.com/ubuntu icinga-$(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/icinga2.list
apt-get update
apt-get install -y php-gd php-json php-dba php-intl php-ldap php-pdo-mysql php-pgsql php-imagick php-dom
apt-get install -y icingaweb2
addgroup --system icingaweb2
usermod -a -G icingaweb2 www-data
nano /etc/php/7.*/apache2/php.ini
vi /etc/php/7.*/apache2/php.ini
systemctl restart apache2
icingacli setup token create
mysql -u root -p
icinga2 api setup
cat /etc/icinga2/conf.d/api-users.conf
systemctl restart icinga2

