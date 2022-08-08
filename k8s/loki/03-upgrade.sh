
CERTBASE=../../lets/do-berlindevops.com
SECRETNAME=loki.berlindevops.com-tls

kubectl -n loki delete secret $SECRETNAME
kubectl -n loki create secret tls $SECRETNAME --cert=$CERTBASE/cert.pem --key=$CERTBASE/privkey.pem 

helm upgrade --install --debug --namespace loki --values=values.yaml loki helm/
