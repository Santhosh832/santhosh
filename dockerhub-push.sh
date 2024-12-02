#!/bin/bash

# Exit script on any error
set -e 
# Docker credentials (replace with environment variables or Jenkins credentials)
DOCKER_USERNAME=$1
DOCKER_PASSWORD=$2
IMAGE_NAME="web-app"
IMAGE_TAG="latest"
DOCKER_REPO="pradeeporkodi/$3"

echo "Logging in to Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "Building Docker image..."
docker build -t "$DOCKER_REPO:$IMAGE_TAG" .

echo "Tagging Docker image..."
docker tag "$DOCKER_REPO:$IMAGE_TAG" "$DOCKER_REPO:$IMAGE_TAG"

echo "Pushing Docker image to Docker Hub..."
docker push "$DOCKER_REPO:$IMAGE_TAG"

echo "Docker image pushed successfully: $DOCKER_REPO:$IMAGE_TAG"

echo "Logging out from Docker Hub..."
docker logout
