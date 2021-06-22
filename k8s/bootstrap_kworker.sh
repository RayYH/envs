#!/bin/bash

echo "[Task 1] Config Containered"
mkdir -p /etc/systemd/system/containerd.service.d
cat >/etc/systemd/system/containerd.service.d/http-proxy.conf <<EOF
[Service]
Environment="HTTP_PROXY=http://172.16.16.1:1087/" "HTTPS_PROXY=http://172.16.16.1:1087/" "NO_PROXY=localhost,127.0.0.1,172.16.16.100,172.16.16.101,172.16.16.102,.example.com"
EOF
systemctl daemon-reload
systemctl restart containerd.service

echo "[TASK 2] Join node to Kubernetes Cluster"
apt install -qq -y sshpass >/dev/null 2>&1
sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no kmaster.example.com:/joincluster.sh /joincluster.sh 2>/dev/null
bash /joincluster.sh >/dev/null 2>&1
