DOMAIN="cicd.berlindevops.com"
kubectl create secret tls gitops-tls --namespace=flux-system --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
