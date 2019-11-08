#!/bin/bash

BROWDOCK=$(pwd)
export BROWDOCK

sudo groupadd -r browdock && sudo useradd -r -s /bin/false -g browdock browdock
xhost +SI:localuser:browdock

cd Chrome
chmod u+x build.sh run.sh
./build.sh
sudo ln -s $(pwd)/chrome-docker /usr/local/bin/
chmod u+x $(pwd)/chrome-docker

cd ..

cd Chromium
chmod u+x build.sh run.sh
./build.sh
sudo ln -s $(pwd)/chromium-docker /usr/local/bin/
chmod u+x $(pwd)/chromium-docker

cd ..

cd Brave
chmod u+x build.sh run.sh
./build.sh
sudo ln -s $(pwd)/brave-docker /usr/local/bin/
chmod u+x $(pwd)/brave-docker

cd ..

cd Firefox
chmod u+x build.sh run.sh
./build.sh
sudo ln -s $(pwd)/firefox-docker /usr/local/bin/
chmod u+x $(pwd)/firefox-docker

cd ..