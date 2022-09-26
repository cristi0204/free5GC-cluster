DOMAIN="berlindevops.com"
NAME="kibana2"
NAMESPACE="elastic-system-mda"
kubectl create secret tls kibana2-tls-certificate --namespace=$NAMESPACE --cert=../../../lets/do-$DOMAIN/fullchain.pem --key=../../../lets/do-$DOMAIN/privkey.pem