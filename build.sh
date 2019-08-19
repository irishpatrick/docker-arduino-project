#!/bin/bash

# script to build the docker container

# require arch argument
if [ -z $1 ]
then
    echo "Please specify the architecture."
    exit 1
fi

# set container tag to <folder_name>-<arch>
tag="${PWD##*/}-$1"

# build container
docker build . -t $tag --build-arg arch=$1

