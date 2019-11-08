#!/bin/bash

xhost +local:

docker container run -it --rm \
--user chrome:chrome \
--security-opt seccomp=$BROWDOCK/Chrome/chrome.json \
--net=host --env="DISPLAY" \
-v /dev/shm:/dev/shm \
--device /dev/dri \
-v $HOME/Downloads:/home/chrome/Downloads \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
chrome-docker 2>&1 >/dev/null

xhost -local: