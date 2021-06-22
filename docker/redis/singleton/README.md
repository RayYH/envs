# 单实例 Redis

```bash
$ docker-compose up -d
# 检查容器是否正常运行
$ docker exec -it dev_redis_singletion redis-cli
127.0.0.1:6379> KEYS *
(empty array)
```
