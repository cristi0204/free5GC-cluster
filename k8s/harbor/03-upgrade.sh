
CERTBASE=../../lets/do-berlindevops.com
SECRETNAME=harbor.berlindevops.com-tls

kubectl -n harbor delete secret $SECRETNAME
kubectl -n harbor create secret tls $SECRETNAME --cert=$CERTBASE/fullchain.pem --key=$CERTBASE/privkey.pem 

helm upgrade --install --debug --namespace harbor --values=values.yaml harbor helm/
