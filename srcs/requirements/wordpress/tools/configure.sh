#!/bin/sh

sed -i 's|PHP_PORT|9000|g' /etc/php/7.3/fpm/pool.d/www.conf

if [ -f /var/www/html/wordpress/wp-config.php ]
then
	echo "wordpress already installed"
else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --path=/var/www/html/wordpress --allow-root
	wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PWD --dbhost=mariadb --path=/var/www/html/wordpress --skip-check --allow-root
	wp core install --path=/var/www/html/wordpress --url=$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp theme install teluro --path=/var/www/html/wordpress --activate --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --path=/var/www/html/wordpress --user_pass=$WP_PWD --allow-root
fi

/usr/sbin/php-fpm7.4 -F -R
# # wait for mysql
# while ! mariadb -h$MYSQL_HOSTNAME -u$WP_DB_USER -p$WP_DB_PWD $WP_DB_NAME &>/dev/null; do
#     sleep 3
# done

# if [ ! -f "/var/www/html/index.html" ]; then

#     # static website
#     mv /tmp/index.html /var/www/html/index.html

#     # adminer
#     wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
#     wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null

#     wp core download --allow-root
#     wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PWD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
#     wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
#     wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
#     wp theme install inspiro --activate --allow-root

#     wp plugin install redis-cache --activate --allow-root
#     wp plugin update --all --allow-root

# fi

# wp redis enable --allow-root

# echo "Wordpress started on :9000"
# /usr/sbin/php-fpm7 -F -R