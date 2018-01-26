#Grab the latest alpine image
FROM node:alpine

RUN apk update
RUN apk add docker
RUN rc-update add docker boot
RUN service docker start
RUN docker ps

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

#EXPOSE 8080
CMD [ "npm", "start" ]