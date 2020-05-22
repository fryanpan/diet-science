#!/bin/bash

docker container prune
docker image prune

# If you want to clear everything, use docker system prune
# https://docs.docker.com/config/pruning/
