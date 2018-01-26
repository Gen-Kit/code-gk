#Grab the latest alpine image
FROM ubuntu:14.04

###########################
# Docker SETUP
###########################
RUN apt-get update
RUN apt-get install -y docker.io
RUN ln -sf /usr/bin/docker.io /usr/local/bin/docker
RUN sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

RUN echo "Docker Setup complete"

###########################
# NodeJS setup
###########################
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN echo "NodeJS setup Complete"

###########################
# Start Docker
###########################
#RUN chmod 777 ../API/DockerTimeout.sh
#RUN chmod 777 ../API/Payload/script.sh
#RUN chmod 777 ../API/Payload/javaRunner.sh
#RUN chmod 777 UpdateDocker.sh

RUN service docker.io restart
RUN docker images
#RUN ./UpdateDocker.sh