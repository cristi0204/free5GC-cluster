DOMAIN="berlindevops.com"
NAME="cmak"
kubectl create secret tls cmak-berlindevops-com --namespace=$NAME --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem
