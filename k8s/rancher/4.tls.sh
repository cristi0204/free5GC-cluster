

kubectl delete secret tls-rancher-ingress -n cattle-system
kubectl delete secret ingress-default-cert -n ingress-nginx

kubectl create secret tls tls-rancher-ingress --namespace=cattle-system --cert=../../lets/do-berlindevops.com/fullchain.pem --key=../../lets/do-berlindevops.com/privkey.pem
kubectl create secret tls ingress-default-cert --namespace=ingress-nginx --cert=../../lets/do-berlindevops.com/fullchain.pem --key=../../lets/do-berlindevops.com/privkey.pem
