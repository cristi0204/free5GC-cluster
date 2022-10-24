kubectl get secret elk-cluster-es-elastic-user -o go-template='{{.data.elastic | base64decode}}' -n elastic-system
