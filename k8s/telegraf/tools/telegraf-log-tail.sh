kubectl logs -f --namespace victoriametrics-workload $(kubectl get pods --namespace victoriametrics-workload -l app.kubernetes.io/name=telegraf -o jsonpath='{ .items[0].metadata.name }')
