#!/bin/bash

# script to upload the sketch to the arduino board

# require arch argument
if [ -z $1 ]
then
    echo "Please specify the board architecture."
    exit 1
fi

# set container tag to <folder_name>-<arch>
tag="${PWD##*/}-$1"

# upload sketch
docker run --privileged -v /dev/bus/usb:/dev/bus/usb $tag ino upload -m $1
