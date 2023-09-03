FROM ubuntu:20.04

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

EXPOSE 3307

ENTRYPOINT [ "/tmp/configure.sh" ]

# FROM ubuntu:20.04

# ARG MYSQL_ROOT_PWD
# ARG WP_DB_NAME
# ARG WP_DB_USER
# ARG WP_DB_PWD

# RUN	apt-get update -yq && \
#         apt-get upgrade -y && \
#         apt-get install mariadb-server \
#         mariadb-client -y && \
#         mkdir -p /var/run/mysqld && \
#         chown -R mysql:mysql /var/run/mysqld && \
#         chown -R mysql:mysql /etc/mysql/

# COPY    ./tools/configure.sh /tmp/
# COPY    ./conf/init.sql /tmp/
# COPY    ./conf/my.cnf /etc/mysql
# COPY    ./conf/init.sql /docker-entrypoint-initdb.d/


# RUN     chmod 777 /tmp/configure.sh && chown -R mysql:mysql /tmp/ && \
#         chown -R mysql:mysql /etc/mysql

# USER    mysql

# EXPOSE 3307

# ENTRYPOINT [ "/tmp/configure.sh" ]