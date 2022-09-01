To install ELK stac run the scripts in the following order:

elasticsearch:
    ./01-install-crds.sh
    ./02-install-operator.sh
    ./03-install-elasticsearch.sh
    ./04-install-kibana.sh

structure:
    ./01-repo-add-eck-custom-resources.sh
    ./02-install-eck-custom-resources.sh
    ./04-create-idx-mda-logs-policy.sh
    ./05-create_idx_mda_logs_tmplt.sh

logstash:
    ./01-create-logstash-config-map.sh
    ./02-create-logstash-pod.sh
    ./03-create-logstash-service.sh