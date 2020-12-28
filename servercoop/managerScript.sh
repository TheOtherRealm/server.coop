#!/usr/bin/env bash
echo "Swarm Init on Manager..."
sudo apt-get update
sudo apt-get install -y autoconf libtool
sudo apt-get install -y python-dev libffi-dev gcc libc-dev make netcat-openbsd bc wget git bash build-essential python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping apache2-utils
sudo apt-get update
sudo apt-get install -y tar wget git
sudo apt-get install -y openjdk-8-jdk
sudo apt-get update
sudo apk add libressl
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt-get update
sudo docker swarm leave
sudo docker swarm init --listen-addr 141.126.251.238:2377 --advertise-addr 141.126.251.238:2377
sudo docker swarm join-token --quiet worker > /vagrant/worker_token
sudo docker swarm join-token --quiet manager > /vagrant/manager_token
sudo docker network create -d overlay --attachable servercoopattachableoverlay
# docker swarm join --token SWMTKN-1-3g3p3ho1optihvqnhcxn4qy5t237anl87cplwf4ewyq4jhgsr6-2k1s18t7s6m868jbu4s673a7k 10.0.0.200:2377
sudo apt update
cd /vagrant/
docker-compose up -d 