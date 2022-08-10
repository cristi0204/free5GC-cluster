export REDIS_PASSWORD=$(kubectl get secret --namespace redisgraph redis -o jsonpath="{.data.redis-password}" | base64 --decode)
kubectl exec -it redis-master-0 -n redisgraph -- bash -c "redis-cli -a $REDIS_PASSWORD"
