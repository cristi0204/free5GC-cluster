#https://github.com/flannel-io/flannel/issues/1060#issuecomment-455873093
sudo ip link delete flannel.1

# on each host if communication doesn't work
# need to restart all flannel containers
# need to restart all coredns containers
