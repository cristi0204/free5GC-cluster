#!/bin/bash
helm upgrade --install --debug --namespace gcc  --set "imagePullSecrets[0].name=harbor-pull" rc helm/
