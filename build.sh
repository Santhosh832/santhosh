#!/bin/bash
docker login -u sowmyadevop -p dckr pat 7PN2WliApoSTDmCzMKzSPma -GU
sudo docker build -t sowmyadevop/dev:mydeployment 
sudo docker images
sudo docker-compose up-d-remove-orphans
sudo docker ps -a
