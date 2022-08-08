#!/bin/bash

kubectl cp $1 consul/consul-0:/tmp/$1

#Execute the Consul restore command to do the Consul restore

kubectl exec -it consul/consul-0 -- /bin/bash -c "consul snapshot restore /tmp/$1"

