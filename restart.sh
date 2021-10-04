#!/bin/bash

docker-compose down
docker pull mpadge/pkgcheck
docker build --no-cache -t roreviewapi .
docker-compose build
docker-compose up -d
