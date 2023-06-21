#!/bin/sh

# Stop script on first error
set -e

IMAGE_NAME="ramyacloud001/dev"
IMAGE_TAG=$(git rev-parse --short HEAD) # first 7 characters of the current commit hash

echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}, and tagging as latest"
docker build . -t "${IMAGE_NAME}:${IMAGE_TAG}" 
docker tag "${IMAGE_NAME}:${IMAGE_TAG}" "${IMAGE_NAME}:latest"
