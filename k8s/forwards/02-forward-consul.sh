figlet -f cybermedium consul 8080
kubectl port-forward --namespace consul svc/consul-ui 8080:80
