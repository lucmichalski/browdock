#!/bin/bash

docker run -m 6g --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" firefox-docker