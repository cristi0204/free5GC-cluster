DOMAIN="berlindevops.com"
NAMESPACE="ingress-nginx"

# see section in cluster/hz/cluster.yaml for reference of default certificate:
# ingress:
#   extra_args: 
#     default-ssl-certificate: "ingress-nginx/ingress-default-cert"

kubectl delete secret ingress-default-cert -n $NAMESPACE
kubectl create secret tls ingress-default-cert --namespace=$NAMESPACE --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
