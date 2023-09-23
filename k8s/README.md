# Kubernetes Playground

## Aliases

```shell
# completion: complete -o default -F __start_kubectl k
alias k=kubectl
```

## Dashboard

```shell
k apply -f configs/dashboard-adminuser.yaml
# issue token
k -n kubernetes-dashboard create token admin-user
```

visit [localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/) in your browser.

See also:

- https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md
- https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/