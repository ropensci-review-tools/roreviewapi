#!/bin/bash

PROJDIR=/<path>/<to>/<this>/<project>
DOCKERFILE=$PROJDIR/Dockerfile
COMPOSE_FILE=$PROJDIR/docker-compose.yml

docker-compose -f $COMPOSE_FILE down
docker-compose pull
docker build --rm -f $DOCKERFILE --no-cache -t roreviewapi $PROJDIR/
docker-compose -f $COMPOSE_FILE build
docker-compose -f $COMPOSE_FILE up -d
docker system prune -f
