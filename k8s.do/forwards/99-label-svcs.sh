#!/bin/bash
kubectl label svc/consul-ui -n consul forward=true
kubectl label svc/vault -n vault forward=true
kubectl label svc/redis-master -n redisgraph forward=true
kubectl label svc/pushgateway-prometheus-pushgateway -n pushgateway forward=true
kubectl label svc/grafana -n grafana forward=true
