FROM ubuntu:20.04

RUN	apt-get update && apt-get upgrade -y && apt-get install -y && apt-get install -y curl \
		# wget				\
        # tar                 \
		# mariadb-client		\
		# redis				\
		# Wordpress core depencencies
    php-fpm \
    php-bcmath \
    php-bz2 \
    php-calendar \
    php-ctype \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-gd \
    php-gmagick \
    php-gmp \
    php-iconv \
    php-imap \
    php-intl \
    php-json \
    php-mbstring \
    # php-mcrypt \
    php-memcache \
    php-mysql \
    # php-openssl \
    # php-pcntl \
    php-pdo \
    php-pdo-mysql \
    php-pdo-pgsql \
    php-pdo-sqlite \
    php-pgsql \
    php-phar \
    php-posix \
    # php-session \
    php-shmop \
    php-simplexml \
    php-soap \
    php-sockets \
    # php-sodium \
    php-sqlite3 \
    php-sysvsem \
    php-sysvshm \
    php-tokenizer \
    php-xml \
    php-xmlreader \
    php-xmlwriter \
    php-xsl \
    php-zip
    # php-zlib	
		

# php config
RUN groupadd -r nginx && useradd --no-log-init -r -g nginx nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# static website
COPY conf/index.html /tmp/index.html

# install wordpress
RUN curl -o /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/bin/wp
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/wordpress

COPY tools/configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]
