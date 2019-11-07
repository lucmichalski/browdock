#!/bin/bash

docker run --net=host --env="DISPLAY" -v /dev/shm:/dev/shm -v /tmp/.X11-unix:/tmp/.X11-unix:ro firefox-docker 2>&1 >/dev/null