#!/bin/bash

docker run -it --rm \
--net=host --env="DISPLAY" \
-v /dev/shm:/dev/shm \
-v $HOME/Downloads:/home/firefox/Downloads \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
firefox-docker 2>&1 >/dev/null