figlet -f cybermedium grafana 8081
kubectl port-forward --namespace grafana svc/grafana 8081:3000
