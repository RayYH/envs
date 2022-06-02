# Installation

## Intel chip

```sh
brew update
brew install hyperkit
brew install minikube
```

```sh
minikube start --vm-driver=hyperkit

# Services of type LoadBalancer can be exposed via the minikube tunnel command.
# minikube tunnel --cleanup remove orphaned routes
minikube tunnel
```

## M1 chip

Install go and Docker desktop first.

```sh
go install sigs.k8s.io/kind@v0.14.0
```

```sh
kind create cluster

# delete cluster
kind delete cluster

# deploy dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.0/aio/deploy/recommended.yaml
```

## Others

```sh
brew install kubectx
```
