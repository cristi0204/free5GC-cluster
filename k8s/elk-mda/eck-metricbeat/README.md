https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-beat.html
https://www.elastic.co/beats/metricbeat

https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-kubernetes.html


kubectl create -f metricbeat-kubernetes.yaml -n elastic-system
kubectl apply -f examples/standard -n elastic-system


https://www.elastic.co/guide/en/beats/metricbeat/current/load-kibana-dashboards.html

hosts: ['${ELASTICSEARCH_HOST:elasticsearch}:${ELASTICSEARCH_PORT:9200}']
