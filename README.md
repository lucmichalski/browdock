Docker! Chrome! PulseAudio!
===========================

Without VNC, --no-sandbox, and SSH

Instructions
============

1. Install [PulseAudio Preferences](http://freedesktop.org/software/pulseaudio/paprefs/). Debian/Ubuntu users can do this:

        sudo apt-get install paprefs pulseaudio

1. Launch PulseAudio Preferences, go to the "Network Server" tab, and check the "Enable network access to local sound devices" checkbox

1. Restart PulseAudio

        sudo service pulseaudio restart

   On some distributions, it may be necessary to completely restart your computer. You can confirm that the settings have successfully been applied using the `pax11publish` command. You should see something like this (the important part is in bold):

   > Server: {ShortAlphanumericString}unix:/run/user/1000/pulse/native **tcp:YourHostname:4713 tcp6:YourHostname:4713**

   > Cookie: ReallyLongAlphanumericString

1. Choose your browser for test

        banzai@localhost:~$ cd path-to-your-clone-git
        banzai@localhost:~/path-to-your-clone-git$ BROWDOCK=$(pwd)
        banzai@localhost:~/path-to-your-clone-git$ export BROWDOCK
        banzai@localhost:~/path-to-your-clone-git$ cd Chrome
        banzai@localhost:~/path-to-your-clone-git$ ./build.sh
        banzai@localhost:~/path-to-your-clone-git$ setsid ./run.sh

1. Install all

        banzai@localhost:/path-to-your-clone-git$ ./install-all.sh

        echo "export BROWDOCK=\"${BROWDOCK}\"" >> ~/.bashrc

        sudo nano /etc/default/docker
        > DOCKER_OPTS="-icc=false" 

And launch your browser in shell :

        banzai@localhost:~$ chrome-docker &
        banzai@localhost:~$ chromium-docker &
        banzai@localhost:~$ firefox-docker &
        banzai@localhost:~$ brave-docker &

1. Snyk - Check for known vulnerabilities

        sudo npm i npm update
        sudo npm install -g snyk
        snyk auth
        snyk test --docker debian:sid-slim --file=Dockerfile

1. Cheers

https://github.com/jlund/docker-chrome-pulseaudio
https://github.com/jessfraz

And google search