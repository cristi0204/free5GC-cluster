CERTBASE=../../lets/do-berlindevops.com
SECRETNAME=consul.berlindevops.com-tls

helm upgrade --install --debug --namespace consul --values=values.yaml consul helm/

# consul helm chart creates a self signed certificate and puts it into the named secret - thus overwriting it after installation
kubectl -n consul create secret tls $SECRETNAME --cert=$CERTBASE/cert.pem --key=$CERTBASE/privkey.pem -o yaml --dry-run=client | kubectl -n consul apply -f -
