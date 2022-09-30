helm install elastic-operator ./eck-operator/helm -f ./eck-operator/values-eck-operator.yaml -n elastic-system

helm install elasticsearch ./eck-elasticsearch/helm -f ./eck-elasticsearch/values-eck-elasticsearch.yaml -n elastic-system

helm install elastic-kibana ./eck-kibana/helm -f ./eck-kibana/values-eck-kibana.yaml -n elastic-system