DOMAIN="berlindevops.com"
NAME="alertmanager"
NAMESPACE="victoriametrics"
kubectl create secret tls alertmanager-tls-certificate --namespace=$NAMESPACE --cert=../../../lets/do-$DOMAIN/fullchain.pem --key=../../../lets/do-$DOMAIN/privkey.pem
