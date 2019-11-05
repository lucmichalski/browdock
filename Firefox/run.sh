#!/bin/bash

docker run -m 6g --net=host --env="DISPLAY" -v /dev/shm:/dev/shm --volume="$HOME/.Xauthority:/root/.Xauthority:rw" firefox-docker