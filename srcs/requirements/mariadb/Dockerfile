FROM ubuntu:20.04

# RUN apt-get update && apt-get upgrade -y && \
#     apt-get install -y mariadb-server mariadb-client && \
#     rm -rf /var/lib/apt/lists/*

# COPY tools/configure.sh /tmp/configure.sh

# ENTRYPOINT ["sh", "/tmp/configure.sh"]

RUN	apt-get update -yq && \
        apt-get upgrade -y && \
        apt-get install mariadb-server \
        mariadb-client -y && \
        mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && \
        chown -R mysql:mysql /etc/mysql/

COPY    ./tools/configure.sh /tmp/
COPY    ./conf/init.sql /tmp/
COPY    ./conf/my.cnf /etc/mysql

RUN     chmod 777 /tmp/configure.sh && chown -R mysql:mysql /tmp/ && \
        chown -R mysql:mysql /etc/mysql

USER    mysql

EXPOSE 3306

ENTRYPOINT [ "/tmp/configure.sh" ]