#!/bin/sh
echo "Swarm Init on Manager..."
# if [ sudo docker node ls --format '{{json .}}' -f "role=manager" | jq 'if .Self == "true" then "true" else "false" end']; then
# 	echo "Node is already a manager";
# else
# 	echo "Swarm Join..."
# 	# sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377
# fi
# info= $(docker info --format '{{json .}}')
# echo $info.swarm.LocalNodeState
# sudo apt-get update
# sudo apt-get install -y python-dev libffi-dev gcc libc-dev make netcat-openbsd bc wget git bash
# sudo apt-get update
# sudo apk add libressl
# sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo apt-get update
# sudo docker swarm init --listen-addr 141.126.251.238:2377 --advertise-addr 141.126.251.238:2377
# sudo docker swarm join-token --quiet worker > /vagrant/worker_token
# sudo docker swarm join-token --quiet manager > /vagrant/manager_token
# selfId=$(docker info --format '{{json .Swarm.NodeID}}')
# managerIds= $(docker node inspect 7543zq2w72ouxi40slzd253x7 --format "{{ .ManagerStatus.Leader }}")
# echo "$selfId"
# echo "$managerIds"
docker node inspect --format '{{ .ManagerStatus.Leader }}' self
me=$(docker node inspect --format '{{json .ID}}' self)
echo $me
case $(docker node inspect --format '{{ .ManagerStatus.Leader }}' self) in
  true)
    # sudo docker swarm leave
    # sudo docker swarm join --token $(cat /vagrant/worker_token) 141.126.251.238:2377;
	# sudo docker swarm join --token $(cat /vagrant/manager_token) 141.126.251.238:2377;
	# docker node demote manager # $(docker node inspect --format '{{json .ID}}' self)
	echo "Hi myself";;
  false)
    # sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200.238:2377;;
    echo "not me";;
    # sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377;;
  *)
    echo "Unknown state $(docker info --format '{{.Swarm.LocalNodeState}}') am myself? $(docker node ls --format '{{json .Self}}' -f "role=manager")";;
esac
# cd /vagrant/
# docker-compose up -d 