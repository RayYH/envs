#!/bin/bash

echo "[TASK 1] Pull required containers"
mkdir -p /etc/systemd/system/containerd.service.d
cat >/etc/systemd/system/containerd.service.d/http-proxy.conf <<EOF
[Service]
Environment="HTTP_PROXY=http://172.16.16.1:1087/" "HTTPS_PROXY=http://172.16.16.1:1087/" "NO_PROXY=localhost,127.0.0.1,172.16.16.100,172.16.16.101,172.16.16.102,.example.com"
EOF
systemctl daemon-reload
systemctl restart containerd.service
kubeadm config --v=10 --kubernetes-version=1.21.0 images pull >/dev/null 2>&1

echo "[TASK 2] Initialize Kubernetes Cluster"
kubeadm init --v=10 --kubernetes-version=1.21.0 --apiserver-advertise-address=172.16.16.100 --pod-network-cidr=192.168.0.0/16 >>/root/kubeinit.log 2>/dev/null

# 这个应该用 vagrant 用户身份执行的，这里为了方便，直接复制到 vagrant 用户了
mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown 1000:1000 /home/vagrant/.kube/config

echo "[TASK 3] Deploy Calico network"
kubectl --v=10 --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml >/dev/null 2>&1

echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command >/joincluster.sh 2>/dev/null
