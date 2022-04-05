#!/bin/bash
export TOKEN=$(perl -ne 'print $1 if /token\s+([\w\\.]+)/' vault-app-token.txt)

curl \
    -H "X-Vault-Token: $TOKEN" \
    -X GET \
    http://vault.vault.svc.cluster.local:8200/v1/secret/data/apps/microtask | jq
exit 0
