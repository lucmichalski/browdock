#!/bin/bash

docker run --net=host --env="DISPLAY" -v /dev/shm:/dev/shm --volume="$HOME/.Xauthority:/root/.Xauthority:rw" firefox-docker