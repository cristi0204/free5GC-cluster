DOMAIN="berlindevops.com"
NAMESPACE="ingress-nginx"

kubectl delete secret default-ssl-certificate -n $NAMESPACE
kubectl create secret tls default-ssl-certificate --namespace=$NAMESPACE --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
