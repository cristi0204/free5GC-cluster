logstash:
  ./01-create-logstash-config-map.sh
  ./02-create-logstash-pod.sh
  ./03-create-logstash-service.sh

The logstash-stateful.yaml and logstash-crd.yaml are not usable yet and need more work.
To create logstash with a stateful-set use the helm chart: