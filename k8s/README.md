# Kubernetes

Based on [justmeandopensource's kubernetes](https://github.com/justmeandopensource/kubernetes). Due to the existence of GFW, I changed the default mirror to ali cloud mirror so that developers live in china's mainland can run these scripts with no timeouts.

---

```bash
# Ubuntu 1 master + 2 worker
> vagrant up
> vagrant ssh kmaster

$ kubectl get nodes
$ kubectl get cs
```