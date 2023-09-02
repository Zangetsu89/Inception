#!/bin/sh

sed -i 's|MYSQL_DB|'${MYSQL_DB}'|g' /tmp/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /tmp/init.sql
sed -i 's|MYSQL_PWD|'${MYSQL_PWD}'|g' /tmp/init.sql
sed -i 's|MYSQL_ROOT_PWD|'${MYSQL_ROOT_PWD}'|g' /tmp/init.sql
sed -i 's|MYSQL_PORT|3307|g' /etc/mysql/my.cnf
sed -i 's|MYSQL_ADDRESS|0.0.0.0|g' /etc/mysql/my.cnf

if [ -d "/var/lib/mysql/$MYSQL_DB" ]

then
  echo "Database already exists."
  mysqld_safe

else
  mysql_install_db
  mysqld --init-file="/tmp/init.sql"

fi

exec "$@"