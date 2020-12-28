#!/usr/bin/env bash
MANAGERS=$(docker node ls --filter role=manager --format "{{.Hostname}}")
SERVICES=$(docker service ls -q)
for i in $MANAGERS
do
  for j in $SERVICES
  do
    docker service ps $j --filter node=$i --filter desired-state=running --format "Container: {{.Name}} is running on Manager: {{.Node}}"
  done
done