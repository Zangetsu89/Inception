CREATE DATABASE wordpress;
CREATE USER 'edawood'@'%' IDENTIFIED BY 'testmysqlpass5';
GRANT ALL PRIVILEGES ON wordpress.* TO 'edawood'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'testmysqlpass55';

