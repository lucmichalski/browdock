FROM ubuntu:bionic

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN useradd chromium
RUN mkdir -p /home/chromium && chown chromium:chromium /home/chromium

# Packages
RUN apt-get install -y apt-utils dbus-x11 libcanberra-gtk-module libcanberra-gtk3-module pulseaudio chromium-browser
RUN apt-get install -y fonts-symbola libpango1.0-0 libv4l-0

USER chromium
ENV HOME /home/chromium

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/chromium/chromium-pulseaudio-forward
RUN echo '/usr/bin/chromium-browser --disable-gpu' >> /home/chromium/chromium-pulseaudio-forward
RUN chmod 755 /home/chromium/chromium-pulseaudio-forward

COPY local.conf /etc/fonts/local.conf

ENTRYPOINT ["bash", "/home/chromium/chromium-pulseaudio-forward"]