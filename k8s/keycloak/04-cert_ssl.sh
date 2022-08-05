DOMAIN="berlindevops.com"
NAME="keycloak"
kubectl create secret tls keycloak.berlindevops.com-tls --namespace=$NAME --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
