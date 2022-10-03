DOMAIN="berlindevops.com"
NAME="kibana2"
NAMESPACE="elastic-system"
kubectl create secret tls kibana2.berlindevops.com-tls --namespace=$NAMESPACE --cert=../../../lets/do-$DOMAIN/fullchain.pem --key=../../../lets/do-$DOMAIN/privkey.pem