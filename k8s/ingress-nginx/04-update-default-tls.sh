DOMAIN="berlindevops.com"
NAMESPACE="ingress-nginx"

# download and install rke: https://github.com/rancher/rke/releases/
# mv rke_linux-amd64 rke && chmod +x rke
# cd cluster/hz
# vi cluster.yaml
#
# modify section in cluster/hz/cluster.yaml for reference of default certificate:
# ingress:
#   extra_args: 
#     default-ssl-certificate: "ingress-nginx/ingress-default-cert"
#
# after cluster.yaml was changed 
# ./rke_up.sh


kubectl delete secret ingress-default-cert -n $NAMESPACE
kubectl create secret tls ingress-default-cert --namespace=$NAMESPACE --cert=../../lets/do-$DOMAIN/fullchain.pem --key=../../lets/do-$DOMAIN/privkey.pem


# restart nginx-controller to reflect the changes 
# kubectl delete pod -l app=ingress-nginx -n ingress-nginx
