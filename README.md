
## Update the kubeconfig

```
aws eks update-kubeconfig --region eu-west-2 --name wcc-tf

```

```
kubectl create namespace monitoring

kubectl config set-context $(kubectl config current-context) --namespace=monitoring
```

prometheus.monitoring.svc.cluster.local

https://sock-shop.davidstclair.co.uk/


```
kubectl port-forward service/nginx-ingress-controller 8080:80  > /dev/null &
kubectl port-forward service/nginx-ingress-controller-default-backend 8080:80  > /dev/null &
``