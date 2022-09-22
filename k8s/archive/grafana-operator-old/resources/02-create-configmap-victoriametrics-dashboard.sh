kubectl create configmap vmagent.json --from-file=dashboards/vmagent_rev1.json -n grafana-mda
kubectl create configmap vmalert.json --from-file=dashboards/vmalert_rev1.json -n grafana-mda
kubectl create configmap victoriametrics-cluster.json --from-file=dashboards/victoriametrics-cluster_rev1.json -n grafana-mda
kubectl create configmap victoriametrics-cluster-per-tenant-statistic.json --from-file=dashboards/victoriametrics-cluster-per-tenant-statistic_rev1.json -n grafana-mda
