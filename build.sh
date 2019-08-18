#!/bin/bash

if [ -z $1 ]
then
    echo "Please specify the docker container."
    exit 1
fi

docker build -t $1 .

