#!/bin/bash
docker build -t pradeep .
docker tag pradeep:latest pradeeporkodi/dev:latest
docker push pradeeporkodi/dev:latest
