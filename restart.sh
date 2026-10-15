#!/bin/bash

# Project directory is wherever this script lives (works from cron)
PROJDIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
DOCKERFILE=$PROJDIR/Dockerfile
COMPOSE_FILE=$PROJDIR/docker-compose.yml

cd "$PROJDIR" || exit 1
git pull --ff-only

docker-compose -f $COMPOSE_FILE down
docker system prune --all --volumes --force
docker-compose -f $COMPOSE_FILE build --force-rm --no-cache
docker-compose -f $COMPOSE_FILE up -d
