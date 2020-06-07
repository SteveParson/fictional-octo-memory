FROM node:12
WORKDIR /usr/src/app
COPY package*.json ./
RUN apt-get update && apt-get install -y mysql-client
RUN npm install
COPY . .
EXPOSE 8080
