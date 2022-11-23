# fdisk partition sdb

#/dev/sdb    /mnt/sdb    ext4    defaults    0    0

# DOCKER AND SYS UPDATES
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install jq figlet build-essential linux-headers-$(uname -r) apt-transport-https ca-certificates curl software-properties-common socat docker-ce="5:20.10.9~3-0~ubuntu-focal" docker-ce-cli="5:20.10.9~3-0~ubuntu-focal" containerd.io open-iscsi lvm2 git



# DOCKER COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# TFSWITCH and KUBECTL
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin

# HELM
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

#RKE
wget https://github.com/rancher/rke/releases/download/v1.3.15/rke_linux-amd64
mv rke_linux-amd64 rke
chmod +x rke
sudo mv rke /usr/local/bin
rke config --list-version --all
