Alerta installation based on helm charts for version 8.7.0, which is dependant bitnami postgresql helm charts in version 10.6.0,
which is not currently available in the bitnami repo. In this was selected the newest version 10.16.2 compatible with 10.6.0.
The compatibiliy in this context means that the structure of the values.yaml file is the same. Starting from the version 11.*.*
the parameters names changed and do not fit to the helm chart templates of the alerta.

#1. Alerta github repo for the version selected for the installation:
https://github.com/alerta/docker-alerta/tree/v8.7.0/contrib/kubernetes/helm/alerta

#2: Bitnami postgresql repo for the version selected for the installation:
https://artifacthub.io/packages/helm/bitnami/postgresql/10.16.2

#3: and direct link to helm charts.
https://charts.bitnami.com/bitnami/postgresql-10.16.2.tgz

In order to install alerta following steps were done.
1. File #3 was downloaded and stored in the subfolder helm-charts/charts
2. The version of the bitnami postgresql was changed in helm-chart/requirements.yaml
3. values-alerta-modified.yaml was prepared
- parameters to create db and its user are defined in the section global:postgresql:
- parameters to create a connecton url from alerta to database are defined in the section postgresql:

Installation process is started via command ./helm-install.sh

When the installation ends following message appears which allow to gain an access to the alerta GUI

Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace victoriametrics -l "app=alerta,release=alerta" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80