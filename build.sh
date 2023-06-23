#!/bin/sh

# Stop script on first error
set -e
DOCKER_USERNAME="ramyacloud001"
DOCKER_PASSWORD="Ram@jamesbond007"
echo "Authenticating and pushing image to Docker Hub"
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
IMAGE_NAME="ramyacloud001/dev"
IMAGE_TAG=$(git rev-parse --short HEAD) # first 7 characters of the current commit hash

echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}, and tagging as latest"
#docker build -f Dockerfile -t ${IMAGE_NAME}:${IMAGE_TAG} .
docker build -f Dockerfile -t ramyacloud/dev:1.1 .
