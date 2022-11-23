sudo apt update

sudo apt install -y jq

mkdir ~/git/longhorn && cd ~/git/longhorn
wget https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/scripts/environment_check.sh
chmod +x environment_check.sh
./environment_check.sh
# Output example:
# daemonset.apps/longhorn-environment-check created
# waiting for pods to become ready (0/1)
# waiting for pods to become ready (0/1)
# all pods ready (1/1)
#
#  MountPropagation is enabled!
#
# cleaning up...
# daemonset.apps "longhorn-environment-check" deleted
# clean up complete

helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace

kubectl -n longhorn-system get pod

echo -e '\033[38;2;255;0;02mNote: Please wait upto 7 minutes for all the pods to come online. Do not use ctrl+c before 19 pods come online in the next command\033[m'

sleep 7s

watch kubectl -n longhorn-system get pod
