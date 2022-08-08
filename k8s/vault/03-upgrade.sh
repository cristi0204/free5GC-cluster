CERTBASE=../../lets/do-berlindevops.com
SECRETNAME=vault.berlindevops.com-tls

kubectl -n vault delete secret $SECRETNAME
kubectl -n vault create secret tls $SECRETNAME --cert=$CERTBASE/cert.pem --key=$CERTBASE/privkey.pem 

helm upgrade --install --debug --namespace vault --values=values.yaml vault helm/
