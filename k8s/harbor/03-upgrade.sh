kubectl apply -f harbor.berlindevops.com-tls.yaml
helm upgrade --install --debug --namespace harbor --values=values.yaml harbor helm/
