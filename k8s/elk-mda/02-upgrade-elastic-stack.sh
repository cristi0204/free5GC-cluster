helm upgrade elastic-operator ./eck-operator -f values-eck-operator.yaml -n elastic-system-mda

helm upgrade elasticsearch ./eck-elasticsearch -f values-eck-elasticsearch.yaml -n elastic-system-mda

helm upgrade elastic-kibana ./eck-kibana -f values-eck-kibana.yaml -n elastic-system-mda