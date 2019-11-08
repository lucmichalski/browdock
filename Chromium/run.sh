#!/bin/bash

docker container run -it --rm \
--security-opt seccomp=$BROWDOCK/Chromium/chrome.json \
--net=host --env="DISPLAY" \
-v /dev/shm:/dev/shm \
--device /dev/dri \
-v $HOME/Downloads:/home/chromium/Downloads \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
chromium-docker 2>&1 >/dev/null