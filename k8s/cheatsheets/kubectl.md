# Kubectl

```sh
# version
kubectl version -o json

# help
kubectl -h
kubectl create -h

# status
kubectl get nodes
kubectl get all # get all components
kubectl get namespace
kubectl get ns
kubectl get deployment
kubectl get deployment [deployment name] -o yaml # show status field, helpful when debugging
kubectl get deployment [deployment name] -o yaml > result.yml
kubectl get replicaset
kubectl get pod
kubectl get pod -o wide # get more information (e.g. IP address)
kubectl get service
kubectl get secret

# more info
kubectl describe [pod|deployment|service...] [name]

# namespace
kubectl create namespace [namespace name]

# deployment
kubectl create deployment [deployment name] --image=[image]
kubectl edit deployment [deployment name]
kubectl delete deployment [deployment name]

# logs or debug
kubectl logs [pod name]
kubectl logs -f [pod name]
kubectl exec -it [pod name] -- bash

# use configuration file
kubectl apply -f [filename]
kubectl delete -f [filename]
```
