Grafana should be installed before Grafana Operator
Grafana - https://github.com/bitnami/charts/tree/master/bitnami/grafana
Grafana operator - https://github.com/bitnami/charts/tree/master/bitnami/grafana-operator

1. Install Grafana operator
    ./01-install-grafana-operator.sh
    in order to verify if grafana-operator is available run the following command:
    ./tools/grafana-installation-status.sh

2. Create Grafana resources (script runs scripts from the subfolder 'resoruces')
    ./02-install-grafana-resources.sh

2.1 Create VictoriaMetrics datasource
    ./resources/01-create-datasource-victoriametrics.sh
    Grafana is restarted automatically after a datasource creation.

2.2 Create configs map with dashboard's definition for VictoriaMetrics datasource
    ./resources/02-create-configmap-victoriametrics-dashboard.sh

2.3 Create dashboards for VictoriaMetrics datasource
    ./resources/03-create-victoriametrics-dashboard.sh
    Grafana is not restarted automatically after a dashboard installation.


Folders were Grafana's resources are available in the pod:
/etc/grafana/provisioning/datasources
/etc/grafana/provisioning/dashboards

Working with Grafana Dashboards (available also in README-DASHBOARDS.md)
https://github.com/grafana-operator/grafana-operator/blob/master/documentation/dashboards.md

Issues worth to notice:
https://github.com/grafana-operator/grafana-operator/issues/154
https://github.com/grafana-operator/grafana-operator/issues/136


