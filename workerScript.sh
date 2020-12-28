#!/usr/bin/env bash
info=docker info --format '{{json .}}'
info.swarm.LocalNodeState
if[(docker node ls --format {{json .}} -f role=worker | jq if .Self == true then true else false  end)]; then
	echo "Node is already a worker"
else
	echo "Swarm Join..."
	sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377
fi
# case "$(docker info --format '{{json .}}')" in
#   inactive)
#     sudo docker swarm leave
#     sudo docker swarm join --token $(cat /vagrant/worker_token) 141.126.251.238:2377
# 	sudo docker swarm join --token $(cat /vagrant/manager_token) 141.126.251.238:2377;
#   pending)
#     # sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200.238:2377;;
#     echo "Node is not in a swarm cluster but it is pending";;
#     # sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377;;
#   active)
#     echo "Node is in a swarm cluster";;
#   locked)
#     echo "Node is in a locked swarm cluster";;
#   error)
#     echo "Node is in an error state";;
#   *)
#     echo "Unknown state $(docker info --format '{{.Swarm.LocalNodeState}}')";;
# esac