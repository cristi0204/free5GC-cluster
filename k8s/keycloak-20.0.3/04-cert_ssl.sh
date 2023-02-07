DOMAIN="berlindevops.com"
NAME="keycloak"
kubectl create secret tls keycloak.berlindevops.com-tls --namespace=$NAME-latest --cert=/root/git/cluster/lets/do-$DOMAIN/fullchain.pem --key=/root/git/cluster/lets/do-$DOMAIN/privkey.pem
