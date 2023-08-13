-- CREATE USER 'root'@'%' IDENTIFIED BY 'secret';
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
CREATE USER 'dev'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'dev'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS dev;
