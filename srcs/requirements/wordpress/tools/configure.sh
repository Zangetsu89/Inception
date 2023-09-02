#!/bin/sh

sed -i 's|PHP_PORT|9000|g' /etc/php/7.4/fpm/pool.d/www.conf

if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress has been installed"
else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --path=/var/www/html --allow-root
	wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PWD --dbhost=mariadb --path=/var/www/html --skip-check --allow-root
	wp core install --path=/var/www/html --url=$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp theme install teluro --path=/var/www/html --activate --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --path=/var/www/html --user_pass=$WP_PWD --allow-root
fi

/usr/sbin/php-fpm7.4 -F