FROM ubuntu:bionic

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN groupadd -r brave && useradd -r -g brave -G audio,video brave
RUN mkdir -p /home/brave && chown brave:brave /home/brave

# Packages
RUN apt-get install -y apt-utils dbus-x11 libcanberra-gtk-module libcanberra-gtk3-module gnupg curl pulseaudio

# Set the Brave repo.
RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
RUN sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com bionic main" >> /etc/apt/sources.list.d/brave.list'

# Install Chrome.
RUN apt-get update && apt-get -y install brave-browser brave-keyring
RUN apt-get install -y fonts-symbola libpango1.0-0 libv4l-0
    
USER brave
ENV HOME /home/brave

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/brave/brave-pulseaudio-forward
RUN echo '/usr/bin/brave-browser --disable-gpu' >> /home/brave/brave-pulseaudio-forward
RUN chmod 755 /home/brave/brave-pulseaudio-forward

COPY local.conf /etc/fonts/local.conf

ENV LANG en-US

ENTRYPOINT ["bash", "/home/brave/brave-pulseaudio-forward"]