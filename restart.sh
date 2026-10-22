#!/bin/bash

# Project directory is wherever this script lives (works from cron)
PROJDIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
DOCKERFILE=$PROJDIR/Dockerfile
COMPOSE_FILE=$PROJDIR/docker-compose.yml

cd "$PROJDIR" || exit 1
git pull --ff-only

# Fail before taking down the running containers if the Gmail credential files
# named in '.env' are not in the bind-mounted data directory (see
# vignettes/editorsearch.Rmd). '.env' paths are container-side ('/data/email/'),
# so map them to the host-side directory.
HOST_DATA_DIR=/srv/roreviewapi/data
CONTAINER_DATA_DIR=/data/email
env_value() {
    grep -E "^${1}=" "$PROJDIR/.env" | tail -n 1 | cut -d= -f2- | sed -e "s/^[\"']//" -e "s/[\"']$//"
}
GMAIL_OAUTH_CLIENT_SECRET=$(env_value GMAIL_OAUTH_CLIENT_SECRET)
GMAIL_TOKEN_CACHE=$(env_value GMAIL_TOKEN_CACHE)
if [ -z "$GMAIL_OAUTH_CLIENT_SECRET" ] || [ -z "$GMAIL_TOKEN_CACHE" ]; then
    echo "ERROR: GMAIL_OAUTH_CLIENT_SECRET and GMAIL_TOKEN_CACHE must be set in $PROJDIR/.env" >&2
    exit 1
fi
CLIENT_SECRET_HOST="$HOST_DATA_DIR/${GMAIL_OAUTH_CLIENT_SECRET#"$CONTAINER_DATA_DIR"/}"
TOKEN_CACHE_HOST="$HOST_DATA_DIR/${GMAIL_TOKEN_CACHE#"$CONTAINER_DATA_DIR"/}"
if [ ! -f "$CLIENT_SECRET_HOST" ]; then
    echo "ERROR: Gmail OAuth client secret not found at $CLIENT_SECRET_HOST" >&2
    exit 1
fi
if [ ! -d "$TOKEN_CACHE_HOST" ] || [ -z "$(ls -A "$TOKEN_CACHE_HOST")" ]; then
    echo "ERROR: Gmail token cache directory missing or empty at $TOKEN_CACHE_HOST" >&2
    exit 1
fi

docker compose -f $COMPOSE_FILE down
docker system prune --all --volumes --force
docker compose -f $COMPOSE_FILE build --force-rm --no-cache
docker compose -f $COMPOSE_FILE up -d
