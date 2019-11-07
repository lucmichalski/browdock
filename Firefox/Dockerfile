FROM ubuntu:bionic

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN useradd firefox
RUN mkdir -p /home/firefox && chown firefox:firefox /home/firefox

# Packages
RUN apt-get install -y apt-utils dbus-x11 libcanberra-gtk-module libcanberra-gtk3-module firefox pulseaudio
RUN apt-get install -y ffmpeg fonts-noto \
    fonts-noto-cjk \
    fonts-noto-color-emoji

USER firefox
ENV HOME /home/firefox

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/firefox/firefox-pulseaudio-forward
RUN echo '/usr/bin/firefox' >> /home/firefox/firefox-pulseaudio-forward
RUN chmod 755 /home/firefox/firefox-pulseaudio-forward

COPY local.conf /etc/fonts/local.conf

ENV LANG en-US

ENTRYPOINT ["bash", "/home/firefox/firefox-pulseaudio-forward"]