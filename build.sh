#!/bin/bash

if [ -z $1 ]
then
    echo "Please specify the architecture."
    exit 1
fi

tag="${PWD##*/}-$1"

docker build . -t $tag --build-arg arch=$1

