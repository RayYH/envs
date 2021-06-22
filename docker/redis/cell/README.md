# Redis 限流模块

```bash
$ docker-compose up -d
# 检查限流模块是否正常工作
$ docker exec -it dev_redis_cell redis-cli
127.0.0.1:6379> CL.THROTTLE user123 15 30 60 1
1) (integer) 0
2) (integer) 16
3) (integer) 15
4) (integer) -1
5) (integer) 2
127.0.0.1:6379>
```
