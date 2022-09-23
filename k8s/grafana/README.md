https://github.com/grafana/helm-charts/tree/grafana-6.38.6/charts/grafana

To test:
helm template --dry-run --debug grafana-mda -n grafana-mda -f values.yaml helm/