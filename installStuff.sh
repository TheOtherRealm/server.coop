#!/bin/bash
echo "Installing Docker..."
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https  ca-certificates  curl  gnupg-agent  software-properties-common jq
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/trusted.gpg.d/gpg
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant
sudo apt-get update
sudo apt-get install -y python-dev libffi-dev gcc libc-dev make netcat-openbsd bc wget git bash
sudo apt-get update
sudo apk add libressl
