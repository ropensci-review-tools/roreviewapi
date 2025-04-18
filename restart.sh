#!/bin/bash

PROJDIR=/<path>/<to>/<this>/<project>
DOCKERFILE=$PROJDIR/Dockerfile
COMPOSE_FILE=$PROJDIR/docker-compose.yml

docker-compose -f $COMPOSE_FILE down
docker pull ghcr.io/ropensci-review-tools/pkgcheck:latest
docker-compose -f $COMPOSE_FILE pull
# also need to rebuild roreviewapi container for testing:
docker build --no-cache --rm -f $DOCKERFILE --force-rm --no-cache -t roreviewapi $PROJDIR/
# system prune should be run when compose is stopped:
docker system prune --all --volumes --force
docker-compose -f $COMPOSE_FILE build --force-rm --no-cache
docker-compose -f $COMPOSE_FILE up -d
