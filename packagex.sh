#!/bin/bash
docker stop tugboat
docker rm tugboat
docker volume rm tugboat
docker image rm -f tugboat:6.1.0
docker system prune -f
docker buildx build --platform linux/amd64,linux/arm64 --provenance=true --sbom=true --build-arg VERSION=$1 -f container.dockerfile -t robfromboulder/tugboat:$1 --no-cache --push .