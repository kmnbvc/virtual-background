#!/bin/bash

set -e 

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOCKER_COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yml"


v4l2_init="$(sudo modprobe -r v4l2loopback &2> tee)"
if [[ -z "${v4l2_init}" ]]; then
    sudo modprobe v4l2loopback devices=1 video_nr=20 card_label="v4l2loopback" exclusive_caps=1
fi
 
docker-compose -f $DOCKER_COMPOSE_FILE down
docker-compose -f $DOCKER_COMPOSE_FILE build
docker-compose -f $DOCKER_COMPOSE_FILE up -d bodypix
sleep 2s
docker-compose -f $DOCKER_COMPOSE_FILE up -d
sleep 3s
docker-compose -f $DOCKER_COMPOSE_FILE ps
