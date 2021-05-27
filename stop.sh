#!/bin/bash

set -e 

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOCKER_COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yml"

docker-compose --log-level ERROR -f $DOCKER_COMPOSE_FILE down
sudo modprobe -r v4l2loopback
