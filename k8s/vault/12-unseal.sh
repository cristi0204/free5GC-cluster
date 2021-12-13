#!/bin/bash

# INIT
# Remove nasty escape sequences
export UNSEAL=$(perl -ne 'print $1 if /Unseal Key 1:\s+([\w\\.\+\=\/]+)/' vault-init.txt)
export ROOT_TOKEN=$(perl -ne 'print $1 if /Initial Root Token:\s+([\w\\.\+\=\/]+)/' vault-init.txt)

kubectl exec -n vault -ti vault-0 -- vault operator unseal $UNSEAL
kubectl exec -n vault -ti vault-1 -- vault operator unseal $UNSEAL
kubectl exec -n vault -ti vault-2 -- vault operator unseal $UNSEAL
kubectl exec -n vault -ti vault-0 -- vault login $ROOT_TOKEN
