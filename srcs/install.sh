export DEBIAN_FRONTEND="noninteractive"

apt-get update && apt-get upgrade

#install mysql
echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections
wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb
dpkg -i mysql-apt-config_0.8.14-1_all.deb
apt-get update
apt-get install -y mysql-server
rm mysql-apt-config_0.8.14-1_all.deb