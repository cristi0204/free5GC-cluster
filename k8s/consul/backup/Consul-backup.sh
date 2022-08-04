#!/bin/bash

BACKUP_FILE="consul-backup-$(date +'%Y-%m-%d').snap"

#Copy Consul backup script to any Consul pod in the cluster

kubectl cp backup_consul.sh consul/consul-0:/tmp/backup_consul.sh

#Execute the Consul backup script to take the Consul backup

kubectl -n=consul exec  pod/consul-0 -- /tmp/backup_consul.sh >/dev/null

#Retrive the Consul backup snap to local machine

kubectl cp consul/consul-0:/tmp/${BACKUP_FILE} ${BACKUP_FILE}