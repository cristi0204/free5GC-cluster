### REGISTRAR-AS

K8S Manifest for the deployment of the REGISTRAR-AS CNF into an standard K8S cluster. 
It contains the minimal elements to provide the function with no high-availability or auto-scalability. 

K8S Secrets are used to dinamically configure the application. So, please, review them. It is also necessary to set the container images to point out to the correct container registry.

Installation:
- Creation of namespace
```
kubectl apply -f gcc-k8s-namespace.yaml
```
- Deployment of RCDB (IMS Registration high performance database)
```
kubectl apply -f 00_rcdb_secret.yaml
kubectl apply -f 01_rcdb_statefulset.yaml
kubectl apply -f 02_rcdb_service_nodeport.yaml
```
- Deployment of RC (SIP Layer)
```
kubectl apply -f 00_rc_secret.yaml
kubectl apply -f 01_rc_statefulset.yaml
kubectl apply -f 02_rc_service_nodeport.yaml
```
