#!/bin/bash

if [ -z $1 ]
then
    echo "Please specify the docker container."
    exit 1
fi
if [ -z $2 ]
then
    echo "Please specify the board architecture."
    exit 1
fi

docker run --privileged -v /dev/bus/usb:/dev/bus/usb $1 ino upload -m $2
