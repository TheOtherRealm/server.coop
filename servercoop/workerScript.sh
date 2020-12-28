# #!/usr/bin/env bash
# if [ sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377 > grep -q "This node is already part of a swarm" ]; then
# 	echo "Node is already a worker"
# else
# 	echo "Swarm Join..."
# 	sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377
# fi
case "$(docker info --format '{{.Swarm.LocalNodeState}}')" in
  inactive)
    sudo docker swarm join --token $(cat /vagrant/worker_token) 141.126.251.238:2377;;
  pending)
    sudo docker swarm join --token $(cat /vagrant/worker_token) 141.126.251.238:2377;;
    echo "Node is not in a swarm cluster";;
    # sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.200:2377;;
  active)
    echo "Node is in a swarm cluster";;
  locked)
    echo "Node is in a locked swarm cluster";;
  error)
    echo "Node is in an error state";;
  *)
    echo "Unknown state $(docker info --format '{{.Swarm.LocalNodeState}}')";;
esac