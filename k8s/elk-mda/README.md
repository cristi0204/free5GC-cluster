These Scripts can be used to deploy an elasticsearch-cluster.

You can edit the values file for the operator/elasticsearch and kibana seperatly:

    values-eck-elasticsearch.yaml
    values-eck-operator.yaml
    values-eck-kibana.yaml

NOTE: values-eck-operator.yaml contains values for indexLifecyclePolicy and indexTemplate
      These two are costume templates (idx-logs-policy.yaml/idx-logs-tmplt.yaml),
      which are used to configure IndexLifecyclePolicy and IndexTemplate for the elastic system.

The Scripts can be used to install/upgrade/delete the whole elastic-stack:

    03-upgrade-all.sh
    10-delete-all.sh

But they can also deployed/deleted seperatly (Scripts 11-\*.sh - 33-\*.sh).

Note: The operator has to be deployed before elasticsearch and elasticsearch before kibana!


cr operator (to create policies, templates ...) installed in version 0.4
https://github.com/xco-sk/eck-custom-resources/tree/v0.4.0
