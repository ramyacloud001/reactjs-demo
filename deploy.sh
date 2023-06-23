#DOCKER_USERNAME="ramyacloud001"
#DOCKER_PASSWORD="Ram@jamesbond007"
#echo "Authenticating and pushing image to Docker Hub"
#echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
#docker push ${IMAGE_NAME}:${IMAGE_TAG}
#docker push "${IMAGE_NAME}:latest"
docker push ramyacloud001/dev:1.1
echo "Successfully deployed"
