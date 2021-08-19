# MS 架构

```bash
$ docker-compose up -d
```

```bash
# master
# 密码是 secret
$ mysql -h 127.0.0.1 -P 3356 -uroot -p

mysql> GRANT REPLICATION SLAVE ON *.* TO 'replica'@'172.28.5.42' IDENTIFIED BY 'secret';
mysql> SHOW MASTER STATUS;
+----------------------+----------+--------------+------------------+-------------------+
| File                 | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+----------------------+----------+--------------+------------------+-------------------+
| mysql_bin_log.000004 |      154 |              |                  |                   |
+----------------------+----------+--------------+------------------+-------------------+
1 row in set (0.02 sec)
```

```bash
# slave
# 密码是 secret
$ mysql -h 127.0.0.1 -P 3366 -uroot -p
> CHANGE MASTER TO MASTER_HOST='172.28.5.41',MASTER_USER='replica',MASTER_PASSWORD='secret',MASTER_LOG_FILE='mysql_bin_log.000004',MASTER_LOG_POS=154;
> START SLAVE;
> SHOW SLAVE STATUS\G
```

```bash
# master
mysql> SHOW PROCESSLIST;
+----+---------+-------------------+------+-------------+------+---------------------------------------------------------------+------------------+
| Id | User    | Host              | db   | Command     | Time | State                                                         | Info             |
+----+---------+-------------------+------+-------------+------+---------------------------------------------------------------+------------------+
|  2 | root    | 172.28.5.0:58346  | NULL | Query       |    0 | starting                                                      | SHOW PROCESSLIST |
|  3 | replica | 172.28.5.42:44436 | NULL | Binlog Dump |   44 | Master has sent all binlog to slave; waiting for more updates | NULL             |
+----+---------+-------------------+------+-------------+------+---------------------------------------------------------------+------------------+
```
