#!/bin/bash

## Shell Script to Build Kafka Test Docker Image ##

imageName=$1
tagName=$2
echo 'imageName:' $imageName
echo 'tagName:' $tagName

#docker build -t $imageName -f Dockerfile .
docker build -t $imageName . -f ./src/Dockerfile
docker images
docker tag $imageName harbor.berlindevops.com/library/$imageName:$tagName
docker images
docker login harbor.berlindevops.com
docker push harbor.berlindevops.com/library/$imageName:$tagName