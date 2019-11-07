#!/bin/bash

docker container run -it --rm --security-opt seccomp=$(pwd)/chrome.json --net=host --env="DISPLAY" -v /dev/shm:/dev/shm -v /tmp/.X11-unix:/tmp/.X11-unix:ro chrome-docker 2>&1 >/dev/null