# MIT License
#
# Copyright (c) 2019 Patrick Roche
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# what image to use
FROM ubuntu:14.04

MAINTAINER Patrick Roche

# define command-line arguments
ARG arch=uno

# install everything
RUN apt-get update
RUN apt-get -y install arduino
RUN apt-get -y install arduino-core
RUN apt-get -y install libusb-dev
RUN apt-get -y install build-essential
#RUN apt-get -y install gcc-arm-none-eabi
RUN apt-get -y install git
RUN apt-get -y install python
RUN apt-get -y install python-pip
RUN pip install ino

# install the teensy cli tool
#RUN git clone https://github.com/PaulStoffregen/teensy_loader_cli.git
#WORKDIR /teensy_loader_cli
#RUN make
#RUN mv teensy_loader_cli /usr/local/bin/teensy_loader_cli
#RUN teensy_loader_cli --list-mcus; exit 0

# enter arduino directory
WORKDIR /arduino
#RUN ls /usr/share/arduino
# init the directory 
RUN ino init

# clean directories before copying
RUN rm -rf /arduino/src
#RUN rm -rf /arduino/lib

# copy all libraries and source files
COPY src/ /arduino/src/
COPY lib/ /arduino/lib/
#COPY teensy.tar.gz /usr/share/arduino/hardware
#WORKDIR /usr/share/arduino/hardware
#RUN tar xzvf teensy.tar.gz
#WORKDIR /arduino

# build the sketch
RUN ino build -m $arch
