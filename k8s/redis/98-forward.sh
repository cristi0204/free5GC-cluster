#kubectl port-forward --namespace consul svc/consul-ui 8080:80
kubectl port-forward --namespace redis svc/redis 6379:6379

kubectl port-forward --namespace redis svc/redis-master 6379:6379 &
redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD
