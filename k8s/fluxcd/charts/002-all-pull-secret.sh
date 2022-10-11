#!/bin/bash
CONFDIR=$(mktemp -d)
trap "rm -r $CONFDIR 2>/dev/null" 0
docker --config $CONFDIR login harbor.berlindevops.com
kubectl -n gcc create secret generic harbor-pull --type=kubernetes.io/dockerconfigjson --from-file=.dockerconfigjson=${CONFDIR}/config.json
