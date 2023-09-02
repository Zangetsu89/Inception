FROM ubuntu:20.04

ARG MYSQL_ROOT_PWD
ARG MYSQL_USER
ARG MYSQL_PWD
ARG MYSQL_DB
ARG MYSQL_HOSTNAME
ARG WP_DB_NAME
ARG WP_DB_USER
ARG WP_DB_PWD

ENV DEBIAN_FRONTEND=noninteractive

RUN	apt update -y && \
        apt-get upgrade -y && \
		apt-get install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https && \
		wget https://packages.sury.org/php/apt.gpg && \
        apt-get install -y php7.4 \
        php7.4-mysql \
        php7.4-cli \
        php7.4-mbstring \
        php7.4-fpm \
        php7.4-gettext \
        mariadb-client \
        wget && \
        rm -rf /etc/php/7.4/fpm/pool.d/www.conf && \
        mkdir -p /run/php

RUN adduser --system --no-create-home --disabled-login --group nginx

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN 	mkdir -p /run/php

COPY	tools/configure.sh /tmp/
RUN		chmod +x /tmp/configure.sh
ENTRYPOINT	["/tmp/configure.sh"]

WORKDIR	/var/www/html

EXPOSE	9000

CMD		["php-fpm7.4", "-F"]
