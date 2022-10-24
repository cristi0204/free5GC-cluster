DOMAIN="berlindevops.com"
NAME="kibana"
NAMESPACE="elastic"
kubectl create secret tls kibana.berlindevops.com-tls --namespace=$NAMESPACE --cert=../../../lets/do-$DOMAIN/fullchain.pem --key=../../../lets/do-$DOMAIN/privkey.pem