# Kubernetes

Based on [justmeandopensource's kubernetes](https://github.com/justmeandopensource/kubernetes). Due to the existence of GFW, I changed the default mirror to ali cloud mirror so that developers live in china's mainland can run these scripts with no timeouts.

---

由于国内墙的存在，你需要配置代理为 `export http_proxy=http://172.16.16.1:1087;export https_proxy=http://172.16.16.1:1087;`

```bash
# Ubuntu 1 master + 2 worker
> vagrant up
> vagrant ssh kmaster

$ kubectl get nodes
$ kubectl get cs
```

## 问题

1. CNI 插件问题
2. 代理配置什么时候取消
3. 不配置代理的话，会出现什么问题
