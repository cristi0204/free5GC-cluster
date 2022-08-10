helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=rancher.berlindevops.com \
  --set replicas=1 \
  --set ingress.tls.source=secret
