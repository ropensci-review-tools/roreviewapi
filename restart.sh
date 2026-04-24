#!/bin/bash

PROJDIR=/<path>/<to>/<this>/<project>
DOCKERFILE=$PROJDIR/Dockerfile
COMPOSE_FILE=$PROJDIR/docker-compose.yml

docker-compose -f $COMPOSE_FILE down
docker system prune --all --volumes --force
docker-compose -f $COMPOSE_FILE build --force-rm --no-cache
docker-compose -f $COMPOSE_FILE up -d
