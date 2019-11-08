#!/bin/bash

#xhost +local:root

docker run -it --rm \
--user $(id -u):$(id -g) \
--net=host --env="DISPLAY" \
-v /dev/shm:/dev/shm \
--device /dev/dri \
-v $HOME/Downloads:/home/firefox/Downloads \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
firefox-docker 2>&1 >/dev/null

#xhost -local:root