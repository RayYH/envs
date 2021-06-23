# MySQL 8

```bash
$ docker volume create mysql
$ docker-compose up -d
$ docker exec -it dev_mysql mysql -u root -p
Enter password:secret

GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';
FLUSH PRIVILEGES;
```
