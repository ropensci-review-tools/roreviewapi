#!/bin/bash

# https://docs.docker.com/engine/reference/commandline/compose/
# - this envvar is automatically detected when building
COMPOSE_FILE=/<path>/<to>/<this>/<project>/docker-compose.yml

docker-compose down
docker pull mpadge/pkgcheck
docker build --no-cache -t roreviewapi .
docker-compose build
docker-compose up -d
