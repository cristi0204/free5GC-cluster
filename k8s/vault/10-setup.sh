#!/bin/bash

# INIT
kubectl exec -n vault -ti vault-0 -- vault operator init -key-shares=1 -key-threshold=1 | tee vault-init.txt

# Remove nasty escape sequences
export UNSEAL=$(perl -ne 'print $1 if /Unseal Key 1:\s+([\w\\.\+\=\/]+)/' vault-init.txt)
export ROOT_TOKEN=$(perl -ne 'print $1 if /Initial Root Token:\s+([\w\\.\+\=\/]+)/' vault-init.txt)

kubectl exec -n vault -ti vault-0 -- vault operator unseal $UNSEAL
kubectl exec -n vault -ti vault-1 -- vault operator unseal $UNSEAL
kubectl exec -n vault -ti vault-2 -- vault operator unseal $UNSEAL
kubectl exec -n vault -ti vault-0 -- vault login $ROOT_TOKEN

# Add Secrets
kubectl exec -n vault -ti vault-0 -- vault secrets enable -version=2 -path="secret" kv     
kubectl exec -n vault -ti vault-0 -- vault kv put secret/apps/microtask gitlab_token=glpat-ZQe_moVrrax-TzQT427n
kubectl exec -n vault -ti vault-0 -- vault kv get secret/apps/microtask

# configure the Kubernetes authentication method
kubectl exec -n vault -ti vault-0 -- vault auth enable --path="my-kube" kubernetes
kubectl exec -n vault -ti vault-0 -- sh -c 'vault write auth/my-kube/config \
       token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
       kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443" \
       kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt'

# create policy
kubectl exec -n vault -ti vault-0 -- sh -c 'vault policy write microtask-policy - <<EOH
path "secret/*" {
  capabilities = ["list"]
}
path "secret/data/apps/microtask" {
  capabilities = ["read"]
}
path "auth/token/renew-self" {
  capabilities = ["update"]
}
EOH'

# create a Kubernetes authentication role named microtask-role to bind service account in K8s to policy in Vault
kubectl exec -n vault -ti vault-0 -- sh -c 'vault write auth/my-kube/role/microtask \
        bound_service_account_names=microtask-sa \
        bound_service_account_namespaces=test \
        policies=microtask-policy \
        ttl=24h'

TOKEN=$(kubectl exec -n vault -ti vault-0 -- vault token create --policy microtask-policy)
echo "$TOKEN" > vault-app-token.txt
