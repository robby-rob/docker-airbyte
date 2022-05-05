#!/bin/bash

docker build --build-arg version=$airbyte_release -t update-airbyte .
docker run --name update-airbyte update-airbyte
cd ..
docker cp update-airbyte:/home/yq/output/. .
docker container rm update-airbyte
docker image rm update-airbyte