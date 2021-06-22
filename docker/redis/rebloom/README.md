# Redis 布隆过滤器

```bash
$ docker-compose up -d
# 检查布隆过滤器是否正常工作
$ docker exec -it dev_redis_rebloom redis-cli
127.0.0.1:6379> PFADD pv user1
(integer) 1
127.0.0.1:6379> PFADD pv user2
(integer) 1
127.0.0.1:6379> PFCOUNT pv
(integer) 2
127.0.0.1:6379>
```
