#!/bin/bash

# clean up local docker environment
# x.x.0 always refers to private local builds
docker stop tugboat
docker rm tugboat
docker volume rm tugboat
docker image rm -f tugboat:6.1.0
docker system prune -f
docker builder prune -f