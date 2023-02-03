DOMAIN="cicd.berlindevops.com"
NAME="argocd"
kubectl create secret tls $NAME-tls --namespace=argo --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
