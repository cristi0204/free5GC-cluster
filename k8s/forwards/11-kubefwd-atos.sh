sudo -E kubefwd svc -n consul -n vault -n prometheus -n promtail -n pushgateway -n redisgraph -n grafana -d svc.cluster.local -l "forward=true"
