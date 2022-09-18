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
  elastic-system-namespace:
    ./01-install-logstash-helm-elastic-system.sh
    ./02-upgrade-logstash-helm-elastic-system.sh

  elastic-workload-namespace:
    ./03-install-logstash-helm-elastic-workload.sh
    ./04-upgrade-logstash-helm-elastic-workload.sh