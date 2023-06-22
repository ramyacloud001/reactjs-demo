# ==== CONFIGURE =====
# Use a Node 16 base image
FROM node:16-alpine
# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY . .

apt-get update &&
apt-get -y install docker-ce &&
apt-get -y install sudo

VOLUME /var/run/docker.sock

RUN adduser jenkins sudo

RUN echo “jenkins ALL=NOPASSWD: ALL” >> /etc/sudoers

RUN usermod -aG docker jenkins

RUN chmod 777 /var/run/docker.sock

RUN chown root:jenkins /var/run/docker.sock

USER jenkins
# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci
# Build the app
RUN npm run build
# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production
# Expose the port on which the app will be running (3000 is the default that `serve` uses)
EXPOSE 3000
# Start the app
CMD [ "npx", "serve", "build" ]
