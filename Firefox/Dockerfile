FROM ubuntu:bionic

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install wget.
RUN apt-get install -y wget gnupg pulseaudio

# Install Chrome.
RUN apt-get update && apt-get -y install firefox

USER apps
ENV HOME /home/apps

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/apps/firefox-pulseaudio-forward
RUN echo '/usr/bin/firefox' >> /home/apps/firefox-pulseaudio-forward
RUN chmod 755 /home/apps/firefox-pulseaudio-forward

ENTRYPOINT ["bash", "/home/apps/firefox-pulseaudio-forward"]