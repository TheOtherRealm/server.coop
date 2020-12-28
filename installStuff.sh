#!/bin/bash
echo "Installing Docker..."
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https  ca-certificates  curl  gnupg-agent  software-properties-common jq
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant
sudo apt-get update
sudo apt-get install -y python-dev libffi-dev gcc libc-dev make netcat-openbsd bc wget git bash
sudo apt-get update
sudo apk add libressl
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt-get update