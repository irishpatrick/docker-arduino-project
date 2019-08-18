FROM ubuntu:14.04

MAINTAINER Patrick Roche

RUN apt-get update

RUN apt-get -y install arduino
#RUN apt-get -y install arduino-core
RUN apt-get -y install build-essential
RUN apt-get -y install python
RUN apt-get -y install python-pip
RUN pip install ino

WORKDIR /arduino
RUN ino init

COPY src/ /arduino/src/
COPY lib/ /arduino/lib/
RUN ino build -m mega2560
