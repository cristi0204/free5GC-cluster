#!/bin/bash
helm upgrade --install --debug --namespace gcc  --set storageClassName="longhorn","imagePullSecrets[0].name=harbor-pull" rcdb helm/
