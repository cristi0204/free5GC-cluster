These Scripts can be used to deploy an elasticsearch-cluster.

A. Helm charts for Elastic Cloud for Kubernetes (version 2.4)
1. eck-operator
https://github.com/elastic/cloud-on-k8s/tree/2.4/deploy/eck-operator

2. eck-elasticsearch
https://github.com/elastic/cloud-on-k8s/tree/2.4/deploy/eck-elasticsearch

3. eck-kibana
https://github.com/elastic/cloud-on-k8s/tree/2.4/deploy/eck-kibana

Component 1,2,3 can be also installed using combined helm charts
https://github.com/elastic/cloud-on-k8s/tree/2.4/deploy/eck-stack

B. Helm charts from elastic, offically taged up to version 7.*.
Helm charts currently updated to the version 8.4.1 but without repository tagging.
4. eck-logstash
https://github.com/elastic/helm-charts/tree/main/logstash

C. Helm charts prepared by Atos, based on 
https://raw.githubusercontent.com/elastic/beats/8.4/deploy/kubernetes/filebeat-kubernetes.yaml
https://www.elastic.co/guide/en/beats/filebeat/current/running-on-kubernetes.html
5. eck-filebeat

D. Helm chart to install operator for creating custom resources in ELK stack 
6. eck-cr-operator
https://github.com/xco-sk/eck-custom-resources/tree/v0.4.0

7. eck-cr-resources

E. Metricbeat currently not used in the project. Helm charts not prepared.
8. eck-metricbeat

NOTE: eck-cr-resources/values.yaml contains values for indexLifecyclePolicy and indexTemplate
      These two are costume templates (idx-logs-policy.yaml/idx-logs-tmplt.yaml),
      which are used to configure IndexLifecyclePolicy and IndexTemplate for the elastic system.

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