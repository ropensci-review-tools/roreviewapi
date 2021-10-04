#!/bin/bash

COMPOSE_DIR=/<path>/<to>/<this>/<project>
DOCKERFILE=$COMPOSE_DIR/Dockerfile
COMPOSE_FILE=$COMPOSE_DIR/docker-compose.yml

docker-compose -f $COMPOSE_FILE down
docker pull mpadge/pkgcheck
docker build --rm -f $DOCKERFILE --no-cache -t roreviewapi
docker-compose -f $COMPOSE_FILE build
docker-compose -f $COMPOSE_FILE up -d
