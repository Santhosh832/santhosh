#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u vasavivodnala -p Asviarha@2014
    docker tag latest vasavivodnala/dev
    docker push vasavivodnala/dev

elif [[ $GIT_BRANCH == "origin/master" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u vasavivodnala -p Asviarha@2014
    docker tag latest vasavivodnala/prod
    docker push vasavivodnala/prod
fi
