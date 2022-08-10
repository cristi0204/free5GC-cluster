figlet -f cybermedium pushgateway 9091
kubectl port-forward --namespace pushgateway svc/pushgateway-prometheus-pushgateway 9091:9091
