# what image to use
FROM ubuntu:14.04

MAINTAINER Patrick Roche

# define command-line arguments
ARG arch=uno

# install everything
RUN apt-get update
RUN apt-get -y install arduino
#RUN apt-get -y install arduino-core
RUN apt-get -y install build-essential
RUN apt-get -y install python
RUN apt-get -y install python-pip
RUN pip install ino

# enter arduino directory
WORKDIR /arduino
# init the directory 
RUN ino init

# copy all libraries and source files
COPY src/ /arduino/src/
COPY lib/ /arduino/lib/

# build the sketch
RUN ino build -m $arch
