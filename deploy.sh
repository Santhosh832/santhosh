#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u vasavivodnala -p Asviarha@2014
    docker tag test vasavivodnala/dev:latest
    docker push vasavivodnala/dev:latest

elif [[ $GIT_BRANCH == "origin/master" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u vasavivodnala -p Asviarha@2014
    docker tag test vasavivodnala/prod:latest 
    docker push vasavivodnala/prod:latest
fi


