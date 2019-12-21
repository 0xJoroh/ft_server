FROM debian:buster

COPY srcs/install.sh /tmp/
COPY srcs/setup.sh /tmp/
COPY srcs/wordpress /var/www/html/wordpress
COPY srcs/phpmyadmin /var/www/html/phpmyadmin
COPY srcs/default /
COPY srcs/nginx-selfsigned.crt /etc/ssl/certs/
COPY srcs/nginx-selfsigned.key /etc/ssl/private/

RUN apt-get update && apt-get upgrade

RUN apt-get install -y nginx
RUN mv default /etc/nginx/sites-available/

RUN apt-get install -y php7.3-fpm php-mysql wget unzip lsb-release gnupg
RUN apt-get update

#install wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod 755 -R /var/www/html/wordpress/
RUN apt-get update

#install phpmyadmin
RUN chown -R www-data:www-data /var/www/html/phpmyadmin/
RUN apt-get update

RUN bash /tmp/install.sh
EXPOSE 80 443
CMD ["bash" ,"/tmp/setup.sh"]