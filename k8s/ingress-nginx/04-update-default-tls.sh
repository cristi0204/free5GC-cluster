DOMAIN="berlindevops.com"
NAMESPACE="ingress-nginx"

kubectl delete secret ingress-default-cert -n $NAMESPACE
kubectl create secret tls ingress-default-cert --namespace=$NAMESPACE --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
