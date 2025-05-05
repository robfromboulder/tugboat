#!/bin/bash
docker stop tugboat
docker rm tugboat
docker image rm -f tugboat:6.2.0
docker system prune -f
docker build --build-arg VERSION=6.2.0 -f container.dockerfile -t tugboat:6.2.0 --no-cache .