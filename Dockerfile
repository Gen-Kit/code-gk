#Grab the latest alpine image
FROM docker

COPY df ./
RUN docker run --privileged -d docker:dind
RUN docker build -t 'virtual_machine' - < df

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY API/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY ./API/* .

#EXPOSE 8080
CMD [ "npm", "start" ]