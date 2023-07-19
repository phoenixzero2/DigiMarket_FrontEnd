# Base image for docker image:
FROM node:16.17.1

#workdir for app directory
WORKDIR /usr/src/DigiMarket_FrontEnd

#copy package.json to image
COPY package*.json ./

#Update container
RUN apt-get update

# Update to latest NPM version:
RUN npm install -g npm@9.7.2

#Install all dependencies in docker image
RUN yarn install

#Copy all code contents to coker image
COPY . .

#expose port used by socket hub
EXPOSE 3000

#Run front end
CMD ["yarn", "start"]