DOMAIN="berlindevops.com"
NAME="grafana-mda"
kubectl create secret tls grafana.berlindevops.com-tls --namespace=$NAME --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
