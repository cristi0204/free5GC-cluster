systemctl disable systemd-resolved.service

service systemd-resolved stop

rm /etc/resolv.conf

cat << EOF > /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

service systemd-networkd restart
