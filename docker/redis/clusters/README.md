# Redis 集群

## `redis-cli` 自动创建

```bash
$ docker-compose down
$ rm cluster-confs/*.conf
$ docker-compose up -d
$ docker exec -it redis_clusters_node_1 /bin/bash

> redis-cli --cluster info 172.28.5.31:6379
172.28.5.31:6379 (67630820...) -> 0 keys | 0 slots | 0 slaves.
[OK] 0 keys in 1 masters.
0.00 keys per slot on average.

> redis-cli --cluster create --cluster-replicas 1 172.28.5.31:6379 172.28.5.32:6379 172.28.5.33:6379 172.28.5.34:6379 172.28.5.35:6379 172.28.5.36:6379
>>> Performing hash slots allocation on 6 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
Adding replica 172.28.5.35:6379 to 172.28.5.31:6379
Adding replica 172.28.5.36:6379 to 172.28.5.32:6379
Adding replica 172.28.5.34:6379 to 172.28.5.33:6379
M: 67630820a18c79a535b1723705b84d8babceaf3e 172.28.5.31:6379
   slots:[0-5460] (5461 slots) master
M: f1c74c57d1c523ba7d754482d592a6bb9cb10d25 172.28.5.32:6379
   slots:[5461-10922] (5462 slots) master
M: 8926ac112e6289bd6da428938dd2e025fc34920e 172.28.5.33:6379
   slots:[10923-16383] (5461 slots) master
S: 3fc7a24a0e48ab868a31c4183aca099c3305b1e8 172.28.5.34:6379
   replicates 8926ac112e6289bd6da428938dd2e025fc34920e
S: 36b8eaa926c436d8fd68a3766aab894ba032693f 172.28.5.35:6379
   replicates 67630820a18c79a535b1723705b84d8babceaf3e
S: 8b7138f8ad5159e4f95b073e2b66597bdc158eee 172.28.5.36:6379
   replicates f1c74c57d1c523ba7d754482d592a6bb9cb10d25
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
...
>>> Performing Cluster Check (using node 172.28.5.31:6379)
M: 67630820a18c79a535b1723705b84d8babceaf3e 172.28.5.31:6379
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
M: 8926ac112e6289bd6da428938dd2e025fc34920e 172.28.5.33:6379
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
M: f1c74c57d1c523ba7d754482d592a6bb9cb10d25 172.28.5.32:6379
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
S: 36b8eaa926c436d8fd68a3766aab894ba032693f 172.28.5.35:6379
   slots: (0 slots) slave
   replicates 67630820a18c79a535b1723705b84d8babceaf3e
S: 8b7138f8ad5159e4f95b073e2b66597bdc158eee 172.28.5.36:6379
   slots: (0 slots) slave
   replicates f1c74c57d1c523ba7d754482d592a6bb9cb10d25
S: 3fc7a24a0e48ab868a31c4183aca099c3305b1e8 172.28.5.34:6379
   slots: (0 slots) slave
   replicates 8926ac112e6289bd6da428938dd2e025fc34920e
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.

> redis-cli --cluster info 172.28.5.31:6379
172.28.5.31:6379 (67630820...) -> 0 keys | 5461 slots | 1 slaves.
172.28.5.33:6379 (8926ac11...) -> 0 keys | 5461 slots | 1 slaves.
172.28.5.32:6379 (f1c74c57...) -> 0 keys | 5462 slots | 1 slaves.
[OK] 0 keys in 3 masters.
0.00 keys per slot on average.
```

## 手动创建

```bash
$ docker-compose down
$ rm cluster-confs/*.conf
$ docker-compose up -d
$ docker exec -it redis_clusters_node_1 /bin/bash

> redis-cli
# 只有自身节点
127.0.0.1:6379> CLUSTER NODES
d3e0877e4dda8f467f9965aca8907f61d423a761 :6379@16379 myself,master - 0 0 0 connected

# 和其他节点握手
127.0.0.1:6379> CLUSTER MEET 172.28.5.32 6379
OK
127.0.0.1:6379> CLUSTER MEET 172.28.5.33 6379
OK
127.0.0.1:6379> CLUSTER MEET 172.28.5.34 6379
OK
127.0.0.1:6379> CLUSTER MEET 172.28.5.35 6379
OK
127.0.0.1:6379> CLUSTER MEET 172.28.5.36 6379
OK
127.0.0.1:6379> CLUSTER NODES
c03b83b951128b32daa874f861f843bfb68fd01b 172.28.5.32:6379@16379 master - 0 1617874876624 1 connected
f98efd229de59ba7fc4f08ae8de67e49e637a466 172.28.5.35:6379@16379 master - 0 1617874873568 0 connected
f5b7ebf7731f4520e66286362d457c3bb1a5c097 172.28.5.34:6379@16379 master - 0 1617874876000 4 connected
94b7d8e91d051d0160f9122b946483c2d65ec404 172.28.5.36:6379@16379 master - 0 1617874874587 5 connected
d3e0877e4dda8f467f9965aca8907f61d423a761 172.28.5.31:6379@16379 myself,master - 0 1617874875000 2 connected
e5ccd77377002edc7a51c98b7782f220785fdfd0 172.28.5.33:6379@16379 master - 0 1617874874000 3 connected

# 查看集群信息
127.0.0.1:6379> CLUSTER INFO
cluster_state:fail
cluster_slots_assigned:0
cluster_slots_ok:0
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:0
cluster_current_epoch:5
cluster_my_epoch:2
cluster_stats_messages_ping_sent:42
cluster_stats_messages_pong_sent:49
cluster_stats_messages_meet_sent:5
cluster_stats_messages_sent:96
cluster_stats_messages_ping_received:49
cluster_stats_messages_pong_received:47
cluster_stats_messages_received:96
```

通过上面的输出结果可知，集群分配的 slots 数目是 0，下面我们通过 `redis-cli` 在其中的三个 nodes 上分配 16384 个 slots。

```bash
# 在宿主机中执行 slots
$ docker exec -it redis_clusters_node_1 redis-cli CLUSTER ADDSLOTS $(seq 0 5461)
$ docker exec -it redis_clusters_node_2 redis-cli CLUSTER ADDSLOTS $(seq 5462 10922)
$ docker exec -it redis_clusters_node_3 redis-cli CLUSTER ADDSLOTS $(seq 10923 16383)

# 进入容器查看集群信息
$ docker exec -it redis_clusters_node_1 /bin/bash
> redis-cli
127.0.0.1:6379> CLUSTER INFO
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:3
cluster_current_epoch:5
cluster_my_epoch:2
cluster_stats_messages_ping_sent:868
cluster_stats_messages_pong_sent:930
cluster_stats_messages_meet_sent:10
cluster_stats_messages_sent:1808
cluster_stats_messages_ping_received:930
cluster_stats_messages_pong_received:878
cluster_stats_messages_received:1808
127.0.0.1:6379> CLUSTER NODES
c03b83b951128b32daa874f861f843bfb68fd01b 172.28.5.32:6379@16379 master - 0 1617875841424 1 connected 5462-10922
f98efd229de59ba7fc4f08ae8de67e49e637a466 172.28.5.35:6379@16379 master - 0 1617875841000 0 connected
f5b7ebf7731f4520e66286362d457c3bb1a5c097 172.28.5.34:6379@16379 master - 0 1617875839000 4 connected
94b7d8e91d051d0160f9122b946483c2d65ec404 172.28.5.36:6379@16379 master - 0 1617875842439 5 connected
e5ccd77377002edc7a51c98b7782f220785fdfd0 172.28.5.33:6379@16379 master - 0 1617875841000 3 connected 10923-16383
d3e0877e4dda8f467f9965aca8907f61d423a761 172.28.5.31:6379@16379 myself,master - 0 1617875839000 2 connected 0-5461
```

目前还有三个节点没有使用，作为一个完整的集群，每个负责处理 slots 的节点应该具有从节点，保证当它出现故障时可以自动进行故障转移。集群模式下，Redis 节点按角色可以分为主节点和从节点。首次启动的节点和被分配 slots 的节点都是主节点，从节点负责复制主节点槽信息和相关的数据。使用 `CLUSTER REPLICATE <nodeId>` 命令可以让一个节点成为从节点。其中命令的执行必须在对应的从节点上执行，`nodeId` 是要复制主节点的节点 ID，我们可以在宿主机中执行下面的命令来生成从节点。

```bash
# 节点 4 5 6 分别作为节点 1 2 3 的从节点
$ docker exec -it redis_clusters_node_4 redis-cli CLUSTER REPLICATE d3e0877e4dda8f467f9965aca8907f61d423a761
$ docker exec -it redis_clusters_node_5 redis-cli CLUSTER REPLICATE c03b83b951128b32daa874f861f843bfb68fd01b
$ docker exec -it redis_clusters_node_6 redis-cli CLUSTER REPLICATE e5ccd77377002edc7a51c98b7782f220785fdfd0

# 查看当前节点信息
$ docker exec -it redis_clusters_node_1 redis-cli CLUSTER INFO
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:3
cluster_current_epoch:5
cluster_my_epoch:2
cluster_stats_messages_ping_sent:1171
cluster_stats_messages_pong_sent:1232
cluster_stats_messages_meet_sent:10
cluster_stats_messages_sent:2413
cluster_stats_messages_ping_received:1232
cluster_stats_messages_pong_received:1181
cluster_stats_messages_received:2413
```
