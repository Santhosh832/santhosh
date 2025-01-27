#!/bin/bash

# Ensure Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Docker is not running. Please start Docker and try again."
  exit 1
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t my-image-name .

# Optionally, tag the image for a version
# docker tag my-image-name my-repo/my-image-name:v1.0

# Confirm image has been built
if docker images | grep -q 'my-image-name'; then
  echo "Docker image built successfully."
else
  echo "Failed to build the Docker image."
  exit 1
fi
