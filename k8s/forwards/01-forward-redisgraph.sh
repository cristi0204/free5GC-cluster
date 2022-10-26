figlet -f cybermedium redisgraph 6379
kubectl port-forward svc/redis-master -n redisgraph 6379:6379
