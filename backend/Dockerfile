FROM docker.io/node:lts-bullseye
WORKDIR /opt/app
RUN apt-get update && apt-get install -y default-mysql-client
RUN npm update
EXPOSE 8080
