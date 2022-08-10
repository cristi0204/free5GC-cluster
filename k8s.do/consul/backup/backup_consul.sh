#!/bin/bash

#Clear tmp files 

rm -rf /tmp/consul-backup-*

#Connect to consul

#kubectl -n=consul -it exec pod/consul-0 bash

# Backup consul

BACKUP_FILE="consul-backup-$(date +'%Y-%m-%d').snap"
consul snapshot save /tmp/${BACKUP_FILE}

# Inspect the backup
#consul snapshot inspect ${BACKUP_FILE}
