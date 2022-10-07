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

The CR-Resources-Chart can create following Resources used in Kibana:
(learn more at https://www.elastic.co/guide/en/elasticsearch/reference/current/elasticsearch-intro.html)

    - Kibana Dashboards (dashboard.yaml)
    - Index-Lifecycle-Policies (idx-logs-policy.yaml)
    - Index-Templates (idx-logs-tmplt.yaml)
    - Index-Patterns (index-pattern.yaml)
    - Index (index.yaml)
    - Lenses (lens.yaml)
    - Roles (role.yaml)
    - Saved Searches (savedsearch.yaml)
    - Spaces (space.yaml)
    - Users (user.yaml)
    - Visualizations (visualization.yaml)


The Resources are defined as an array of each resource-type,
for each resource at least name and body(Contains the Configuration used in Kibana in json-format)
have to be specified.
For some resources also dependicies or/and a spacename have to specified.
A simple example for each resource is included in the default-values-file.