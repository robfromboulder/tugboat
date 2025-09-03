#!/bin/bash -x

# clean up local docker environment
docker stop tugboat
docker rm tugboat

# remove local containers
# x.x.0 always refers to private local builds
docker image rm -f tugboat:6.3.0

# build containers for native chipset
docker build --build-arg VERSION=6.3.0 -f container.dockerfile -t tugboat:6.3.0 .