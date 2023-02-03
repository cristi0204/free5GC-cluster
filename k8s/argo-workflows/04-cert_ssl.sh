DOMAIN="cicd.berlindevops.com"
NAME="argo"
kubectl create secret tls argoworkflows-tls-certificate --namespace=$NAME --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
