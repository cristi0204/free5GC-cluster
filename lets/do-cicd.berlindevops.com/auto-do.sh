DOMAIN="cicd.berlindevops.com"
certbot certonly --dns-digitalocean --dns-digitalocean-credentials $HOME/.do/do.ini --logs-dir logs/ --config-dir logs/ --work-dir logs/ --email=humans@$DOMAIN --agree-tos -d $DOMAIN -d *.$DOMAIN

mkdir logs
cp logs/archive/$DOMAIN/cert1.pem cert.pem
cp logs/archive/$DOMAIN/chain1.pem chain.pem
cp logs/archive/$DOMAIN/fullchain1.pem fullchain.pem
cp logs/archive/$DOMAIN/privkey1.pem privkey.pem
rm -rf logs

cat fullchain.pem | base64 | tr -d '"\r\n' > fullchain.base64
cat privkey.pem | base64 | tr -d '"\r\n' > privkey.base64
