#https://betterprogramming.pub/managing-elasticsearch-resources-in-kubernetes-39b697908f4e
#install custom resources
helm repo add eck-custom-resources https://xco-sk.github.io/eck-custom-resources/ -n elastic-system
helm install eck-cr eck-custom-resources/eck-custom-resources-operator -n elastic-system

#upgrade helm chart values
helm upgrade --install eck-cr eck-custom-resources/eck-custom-resources-operator -f values.yaml -n elastic-system

#create logs policy
kubectl apply -f idx-mda-logs-policy.yaml -n elastic-system

#create logs template
kubectl apply -f idx-mda-logs-tmplt.yaml -n elastic-system
