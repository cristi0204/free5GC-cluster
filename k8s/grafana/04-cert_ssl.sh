DOMAIN="berlindevops.com"
NAME="grafana"
kubectl create secret tls $NAME-tls --namespace=$NAME --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
