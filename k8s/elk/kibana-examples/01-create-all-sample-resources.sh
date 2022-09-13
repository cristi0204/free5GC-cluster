kubectl apply -f 01-space.yaml -n elastic-system
kubectl apply -f 02-index-template.yaml -n elastic-system
kubectl apply -f 03-index.yaml -n elastic-system
kubectl apply -f 04-index-pattern.yaml -n elastic-system
kubectl apply -f 05-saved-search.yaml -n elastic-system
kubectl apply -f 06-visualization.yaml -n elastic-system
kubectl apply -f 07-lens.yaml -n elastic-system
kubectl apply -f 08-dashboard.yaml -n elastic-system