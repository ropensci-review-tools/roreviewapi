#!/bin/bash

PROJDIR=/<path>/<to>/<this>/<project>
DOCKERFILE=$PROJDIR/Dockerfile
COMPOSE_FILE=$PROJDIR/docker-compose.yml

docker-compose -f $COMPOSE_FILE down
docker pull mpadge/pkgcheck
docker-compose -f $COMPOSE_FILE pull
# also need to rebuild roreviewapi container for testing:
docker build --rm -f $DOCKERFILE --force-rm --no-cache -t roreviewapi $PROJDIR/
docker-compose -f $COMPOSE_FILE build --force-rm --no-cache
docker-compose -f $COMPOSE_FILE up -d
docker system prune -f
