DOMAIN="berlindevops.com"
NAME="grafana"
kubectl create secret tls $NAME-tls --namespace=$NAME --cert=../../cert/do-$DOMAIN/fullchain.pem --key=../../cert/do-$DOMAIN/privkey.pem
