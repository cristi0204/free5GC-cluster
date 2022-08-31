#https://raphaeldelio.medium.com/deploy-logstash-and-filebeat-on-kubernetes-with-eck-ssl-and-filebeat-d9f616737390
#Create config map
#There should be generated dedicated certifacte for communication with Elasticsearch cluster or logstash pod name should changed.
#Currently accepted names are:elk-cluster-es-http, elk-cluster-es-http.elastic-system.svc, elk-cluster-es-http.elastic-system, #elk-cluster-es-internal-http.elastic-system.svc, elk-cluster-es-internal-http.elastic-system, *.elk-cluster-es-default.elastic-system.svc
#Currently ssl certifacte verfication is turn off (ssl_certificate_verification => false)
kubectl apply -f logstash-cm.yaml -n elastic-system

#create pod
kubectl apply -f logstash.yml -n elastic-system

In order to install elasticsearch execute the scripts according to their numbers

elasicssearch:
  ./01-install-crds.sh
  ./02-install-operator.sh
  ./03-install-elasticsearch.sh
  ./04-install-kibana.sh
  ./05-install-logstash.sh

logstash:
  ./01-create-logstash-config-map.sh
  ./02-create-logstash-pod.sh
  ./03-create-logstash-service.sh
