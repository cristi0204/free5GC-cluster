helm install elastic-operator ./eck-operator/helm -f values-eck-operator.yaml -n elastic-system-mda

helm install elasticsearch ./eck-elasticsearch/helm -f values-eck-elasticsearch.yaml -n elastic-system-mda

helm install elastic-kibana ./eck-kibana/helm -f values-eck-kibana.yaml -n elastic-system-mda