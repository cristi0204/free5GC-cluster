# Victoria Metrics Helm Charts

This repository contains Victoria Metrics helm charts.

# Installing the chart

```console
helm install victoria-metrics-cluster ./victoria-metrics-cluster -f vmcluster-modified-values.yaml -n victoriametrics
```

Get the pods lists by running these commands:

```console
kubectl get pods -n victoria-metrics

# or list all resources of victoria-metrics

kubectl get all -n victoria-metrics | grep victoria
```

Get the application by running this commands:

```console
helm list -f victoria-metrics-cluster -n victoria-metrics
```

See the history of versions of ``victoria-metrics`` application with command.

```console
helm history victoria-metrics-cluster -n victoria-metrics
```

# How to change the rules for alertmanager

Change the rules in the vmalert-rules.yaml file and apply the new rules using:

```console
helm upgrade vmalert ./victoria-metrics-alert -f vmalert-rules.yaml -n victoriametrics
```

# How to uninstall VictoriaMetrics

Remove application with command.

```console
helm uninstall victoria-metrics-cluster -n victoria-metrics
```

# Kubernetes compatibility versions

helm charts tested at kubernetes versions from 1.13 to 1.22.

# List of Charts

- [Victoria Metrics Agent](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-agent)
- [Victoria Metrics Alert](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-alert)
- [Victoria Metrics Auth](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-auth/README.md)
- [Victoria Metrics Cluster](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-cluster/README.md)
- [Victoria Metrics k8s Stack](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-k8s-stack/README.md)
- [Victoria Metrics Operator](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-operator/README.md)
- [Victoria Metrics Single-node](https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-single/README.md)