#!/bin/bash

xhost +local:

docker container run -it --rm \
--user brave:brave \
--security-opt seccomp=$BROWDOCK/Brave/chrome.json \
--net=host --env="DISPLAY" \
-v /dev/shm:/dev/shm \
--device /dev/dri \
-v $HOME/Downloads:/home/brave/Downloads \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
brave-docker 2>&1 >/dev/null

xhost -local: