#!/bin/bash

docker container run -m 6g -it --rm --security-opt seccomp=$(pwd)/chrome.json --net=host --env="DISPLAY" -v /dev/shm:/dev/shm --volume="$HOME/.Xauthority:/root/.Xauthority:rw" chromium-docker