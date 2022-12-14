DOMAIN="berlindevops.com"
NAME="cb-fastapi"
kubectl create secret tls cb-fastapi-tls --namespace=$NAME --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem