kubectl get secret --namespace redisgraph redis -o jsonpath="{.data.redis-password}" | base64 --decode
