#!/bin/bash -x

# clean up local docker environment
docker stop tugboat
docker rm tugboat
docker volume rm tugboat

# remove local containers
# x.x.0 always refers to private local builds
docker image rm -f tugboat:6.3.0

# remove any cached layers
docker system prune -f
docker builder prune -f