#!/bin/bash
sh 'chmod +x build.sh' 
sh'./build.sh' 
if [ $GIT BRANCH = "origin/dev" ]; then 
docker tag mydeployment sowmyadevop/dev 
docker push sowmyadevop/dev:mydeployment 
elif [ $GIT BRANCH = "origin/main" ]; then 
docker tag mydeployment sowmyadevop/prod 
docker push sowmyadevop/prod:mydeployment 
fi
