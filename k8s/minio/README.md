
# MinIO

    cd cluster/k8s/minio
    helm repo add minio https://charts.min.io/
    helm repo update

    helm fetch minio/minio --untar
    mv minio helm
    cp helm/values.yaml ./
    vi values.yaml

    ./01-ns.sh
    kubectl apply -f minio.berlindevops.com-tls.yaml
    kubectl apply -f minioweb.berlindevops.com-tls.yaml

    helm upgrade --install --debug --namespace minio --values=values.yaml --set rootUser=rootadmin,rootPassword=xxxxxxx minio helm/

    helm uninstall minio --namespace minio


    