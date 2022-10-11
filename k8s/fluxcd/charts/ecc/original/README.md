### ECC-AS

K8S Manifest for the deployment of the ECC-AS CNF into an standard K8S cluster. 
It contains the minimal elements to provide the function with no high-availability or auto-scalability. 

K8S Secrets are used to dinamically configure the application. So, please, review them. It is also necessary to set the container images to point out to the correct container registry.

Installation:
- Creation of namespace
```
kubectl apply -f gcc-k8s-namespace.yaml
```
- Deployment of ECC-AS (Emergency Calls for IMS)
```
kubectl apply -f 00_ecc_secret.yaml
kubectl apply -f 01_ecc_statefulset.yaml
kubectl apply -f 02_ecc_service_nodeport.yaml
```
