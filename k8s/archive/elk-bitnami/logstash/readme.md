#https://raphaeldelio.medium.com/deploy-logstash-and-filebeat-on-kubernetes-with-eck-ssl-and-filebeat-d9f616737390
#Create config map
#There should be generated dedicated certifacte for communication with Elasticsearch cluster.
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
  elastic-system-namespace:
    ./01-install-logstash-helm-elastic-system.sh
    ./02-upgrade-logstash-helm-elastic-system.sh

  elastic-workload-namespace:
    ./03-install-logstash-helm-elastic-workload.sh
    ./04-upgrade-logstash-helm-elastic-workload.sh


https://docs.bitnami.com/kubernetes/apps/logstash/configuration/use-multiple-pipelines/    


Example of grok expression

%{DATE_EU:date}, %{TIME:time}.\[%{WORD:application}:%{WORD:severity} %{HOSTNAME:hostname}.(?<alarmtype>[A-Z]*).(?<softwarecomponent>[A-Z]*).(?<alarmcode>[0-9]*)\].(?<additionalinfo>[0-9a-z_. \[\]]*) %{GREEDYDATA:message}

27/09/2022, 00:00:02 [GCC:CL GCC11_APPLICATION_CKOCSCDR_0430] [check_ocs_cdrs.ksh 0] Correct number of OCS CDR files in origin directory