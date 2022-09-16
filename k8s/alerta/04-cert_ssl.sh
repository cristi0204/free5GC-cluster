DOMAIN="berlindevops.com"
NAME="alerta"
NAMESPACE="victoriametrics"
kubectl create secret tls alerta-tls-certificate --namespace=$NAMESPACE --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
