cat <<EOF | kubectl create -f -
apiVersion: "k8s.cni.cncf.io/v1"
kind: NetworkAttachmentDefinition
metadata:
  name: macvlan
spec:
  config: '{
    "cniVersion": "0.3.1",
    "name": "macvlan-main",
    "type": "macvlan",
    "mode": "bridge",
    "master": "eth0",
      "ipam": {
            "type": "static"
      }
    }'
EOF
