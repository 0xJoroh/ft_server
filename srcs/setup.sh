#CREATE NEW ROOT AND PASSWORD 
chown -R mysql: /var/lib/mysql
service mysql start
service php7.3-fpm start
mysql --user=root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'root';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';FLUSH PRIVILEGES;"

#CREATE DATABASE	
mysql --user=root -e "CREATE DATABASE wordpress;GRANT ALL PRIVILEGES on wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'root';FLUSH PRIVILEGES;"
chown -R www-data:www-data /var/www/html/wordpress/

apt update
nginx -g "daemon off;"