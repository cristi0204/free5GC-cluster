kubectl apply -f sample-dashboard.yaml -n grafana
kubectl apply -f kafka-exporter-overview.yaml -n grafana
kubectl apply -f kafka-topic-lag-alerts.yaml -n grafana