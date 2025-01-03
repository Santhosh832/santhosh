FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
copy . .


EXPOSE 80
