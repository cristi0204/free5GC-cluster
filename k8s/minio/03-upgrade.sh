kubectl apply -f minio.berlindevops.com-tls.yaml
kubectl apply -f minioweb.berlindevops.com-tls.yaml

helm upgrade --install --debug --namespace minio --values=values.yaml --set rootUser=rootadmin,rootPassword="2Atos@Atos" minio helm/
