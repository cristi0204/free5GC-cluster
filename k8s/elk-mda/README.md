These Scripts can be used to deploy an elasticsearch-cluster.

You can edit the values file for the operator/elasticsearch and kibana seperatly:

    values-eck-elasticsearch.yaml
    values-eck-operator.yaml
    values-eck-kibana.yaml

The Scripts can be used to install/upgrade/delete the whole elastic-stack:

    ./01-install-elastic-stack.sh
    ./02-upgrade-elastic-stack.sh
    ./03-delete-elastic-stack.sh


But they can also deployed/deleted seperatly (Scripts 11-\*.sh - 33-\*.sh).

Note: The operator has to be deployed before elasticsearch and elasticsearch before kibana!

TODO: Logstash
