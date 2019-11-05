FROM ubuntu:bionic

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install wget.
RUN apt-get install -y wget gnupg curl pulseaudio

# Install Chromium.
RUN apt-get update && apt-get -y install chromium-browser

USER apps
ENV HOME /home/apps

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/apps/chromium-pulseaudio-forward
RUN echo '/usr/bin/chromium-browser' >> /home/apps/chromium-pulseaudio-forward
RUN chmod 755 /home/apps/chromium-pulseaudio-forward

ENTRYPOINT ["bash", "/home/apps/chromium-pulseaudio-forward"]