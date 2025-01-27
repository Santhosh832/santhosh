#!/bin/bash

# Server details
SERVER_USER="your-username"
SERVER_IP=172.18.192.1
REMOTE_DIR="/path/to/remote/project"

# Docker image details
IMAGE_NAME="your-image-name"
IMAGE_TAG="latest"  # or specify the tag, e.g., v1.0

# SSH into the server and deploy the image
echo "Deploying Docker image to the server..."

# SSH into the server, pull the image, and run the container
ssh ${SERVER_USER}@${SERVER_IP} << EOF
  # Navigate to the project directory (optional if necessary)
  cd ${REMOTE_DIR}

  # Pull the latest Docker image from Docker Hub or a private registry
  echo "Pulling Docker image ${IMAGE_NAME}:${IMAGE_TAG}..."
  docker pull ${IMAGE_NAME}:${IMAGE_TAG}

  # Stop the currently running container (if any)
  echo "Stopping existing container (if any)..."

  docker stop my-running-container || true
  docker rm my-running-container || true

  # Run the new Docker container
  echo "Running the new Docker container..."
  docker run -d --name my-running-container ${IMAGE_NAME}:${IMAGE_TAG}

  # Optionally, clean up old images (you can skip this if not needed)
  echo "Cleaning up old Docker images..."
  docker image prune -f
EOF

# Confirm the deployment
echo "Docker image deployed and container is running on ${SERVER_IP}."
