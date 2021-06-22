# Redis 主从节点和哨兵

```bash
$ docker-compose up -d
# 检查主从架构状态
$ docker exec -it redis_ms_sentinel_1 redis-cli -p 26679
127.0.0.1:26679> INFO Sentinel
# Sentinel
sentinel_masters:1
sentinel_tilt:0
sentinel_running_scripts:0
sentinel_scripts_queue_length:0
sentinel_simulate_failure_flags:0
master0:name=mymaster,status=ok,address=172.28.5.12:6379,slaves=2,sentinels=3
127.0.0.1:26679>
```
