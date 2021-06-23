# MySQL 5.7

```bash
$ docker volume create mysql57
$ docker-compose up -d
$ docker exec -it dev_mysql_57 mysql -u root -p
Enter password:secret

GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';
FLUSH PRIVILEGES;
```
