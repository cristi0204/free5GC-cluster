figlet Git Secret

flux create secret git free5gc-auth --url=https://gitlab.com/atosnet/cluster-5g.git --username=chiducaf --password=glpat-jdws9VWQFXyU9b-o3wsz --namespace=free5gc

figlet Git Source

flux create source git free5gc --url=https://gitlab.com/atosnet/cluster-5g.git --secret-ref free5gc-auth --branch main --interval 10s --namespace=free5gc

figlet Deploy free5gc-core

flux create hr free5gc-core --source=GitRepository/free5gc --values=/root/git/cluster-5g/k8s/30.free5gc/values.yaml --chart=./k8s/30.free5gc/helm/ --namespace=free5gc

figlet Deploy Ueransim

flux create hr ue --source=GitRepository/free5gc --values=/root/git/cluster-5g/k8s/35.ueransim/values.yaml --chart=./k8s/35.ueransim/helm/ --namespace=free5gc
