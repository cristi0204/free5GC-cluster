#!/bin/bash

## Shell Script to Deploy Kafka Test Image on K8s cluster ##

Namespace=$1
echo 'Namespace:' $Namespace

kubectl create -f kafka-msgGenrator.yaml --namespace=$Namespace
kubectl get pods --namespace=$Namespace
kubectl get svc --namespace=$Namespace