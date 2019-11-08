FROM debian:sid-slim

ARG USER_ID
ARG GROUP_ID

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Packages
RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module firefox-esr pulseaudio ffmpeg fonts-noto \
    fonts-noto-cjk --no-install-recommends

RUN apt-get clean; apt-get autoclean

COPY local.conf /etc/fonts/local.conf

RUN mkdir -p /home/browdock/Downloads
RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/browdock/firefox-pulseaudio-forward
RUN echo '/usr/bin/firefox' >> /home/browdock/firefox-pulseaudio-forward
RUN chown -R ${USER_ID}:${GROUP_ID} /home/browdock

USER ${USER_ID}

ENV HOME /home/browdock

ENTRYPOINT ["bash", "/home/browdock/firefox-pulseaudio-forward"]