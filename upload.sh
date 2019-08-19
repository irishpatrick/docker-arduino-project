#!/bin/bash

if [ -z $1 ]
then
    echo "Please specify the board architecture."
    exit 1
fi

tag="${PWD##*/}-$1"

docker run --privileged -v /dev/bus/usb:/dev/bus/usb $tag ino upload -m $1
