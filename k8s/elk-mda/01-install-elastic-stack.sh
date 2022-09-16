helm install elastic-operator ./eck-operator -f values-eck-operator.yaml -n elastic-system-mda

helm install elasticsearch ./eck-elasticsearch -f values-eck-elasticsearch.yaml -n elastic-system-mda

helm install elastic-kibana ./eck-kibana -f values-eck-kibana.yaml -n elastic-system-mda