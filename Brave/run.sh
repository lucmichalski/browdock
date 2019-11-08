#!/bin/bash

docker container run -it --rm \
--user $(id -u):$(id -g) \
--security-opt seccomp=$BROWDOCK/Brave/chrome.json \
--net=host --env="DISPLAY" \
-v /dev/shm:/dev/shm \
--device /dev/dri \
-v $HOME/Downloads:/home/brave/Downloads \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
brave-docker 2>&1 >/dev/null