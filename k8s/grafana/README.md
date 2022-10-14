https://github.com/grafana/helm-charts/tree/grafana-6.38.6/charts/grafana

To test:
helm template --dry-run --debug grafana-mda -n grafana-mda -f values.yaml helm/



##Automatic Import of Dashboard using sidecar config 

(source: How to add Grafana datasources, dashboards and users via cli using sidecar and configmaps? · Issue #336 · prometheus-community/helm-charts)

In the helm-chart for grafana following config is needed:

```
sidecar:
  image:
    repository: quay.io/kiwigrid/k8s-sidecar
    tag: 1.19.2
    sha: ""
  imagePullPolicy: IfNotPresent
  resources: {}
  
  ...
      
    dashboards:
      enabled: true
      label: grafana_dashboard
      folder: /tmp/dashboards
      provider: 
        foldersFromFilesStructure: true
```

In the configmaps for the dashboards following is needed (NOTE:  Use unique titles and a uniquwe uid or do not secify any uid)

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: sample-grafana-dashboard
  labels:
     grafana_dashboard: "1"
  annotations:
    k8s-sidecar-target-directory: "vmcluster"
data:
  k8s-dashboard.json: |-
    {
      "__inputs": [
        {
...


...
          }
        ]
      },
      "time": {
        "from": "now-1h",
        "to": "now"
      },
      "timepicker": {},
      "timezone": "",
      # Do not specify a uid here and use unique titles
      "title": "VictoriaMetrics - cluster per tenant statistic via Slide car",
      "version": 7,
      "weekStart": "",
      "gnetId": 16399
    }
```
###Add Custom dashboards
Create configmap for custom dashboards By using cli with yaml
If you want to use cli, you should add annotations.

(NOTE:  Use unique titles and an unique uid or do not secify any uid at all)

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-dashboards-configmap-app-status
  labels:
     grafana_dashboard: "1"
  annotations:
      k8s-sidecar-target-directory = "[FOLDER]"
data:
  app-status.json: |-
    {
    _- json contents go here_
    #Use unique titles and an unique uid or do not secify any uid at all i here
    }
```
Create configmap for custom dashboards By using terraform
I used adding configmap by using terraform, thus I put an example in there.

```
resource "kubernetes_config_map" "grafana-dashboards-istio" {
  metadata {
    name      = "grafana-dashboard-istio"
    namespace = kubernetes_namespace.monitoring.metadata[0].name

    labels = {
      grafana_dashboard = 1
    }

    annotations = {
      k8s-sidecar-target-directory = "/tmp/dashboards/istio"
    }
  }

  data = {
    "istio-mesh-dashboard.json"        = file("${path.root}/config/grafana/dashboards/istio/istio-mesh-dashboard.json")
    "istio-performance-dashboard.json" = file("${path.root}/config/grafana/dashboards/istio/istio-performance-dashboard.json")
    "istio-service-dashboard.json"     = file("${path.root}/config/grafana/dashboards/istio/istio-service-dashboard.json")
    "istio-workload-dashboard.json"    = file("${path.root}/config/grafana/dashboards/istio/istio-workload-dashboard.json")
    "pilot-dashboard.json"             = file("${path.root}/config/grafana/dashboards/istio/pilot-dashboard.json")
  }
}
```
