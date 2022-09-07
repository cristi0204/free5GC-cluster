kubectl logs -f --namespace victoriametrics $(kubectl get pods --namespace victoriametrics -l app.kubernetes.io/name=telegraf -o jsonpath='{ .items[0].metadata.name }')
