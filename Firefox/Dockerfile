FROM debian:sid-slim

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN useradd firefox
RUN mkdir -p /home/firefox/Downloads && chown -R firefox:firefox /home/firefox

# Packages
RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module firefox pulseaudio ffmpeg fonts-noto \
    fonts-noto-cjk \
    fonts-noto-color-emoji --no-install-recommends

RUN apt-get clean; apt-get autoclean

COPY local.conf /etc/fonts/local.conf

USER firefox
ENV HOME /home/firefox

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/firefox/firefox-pulseaudio-forward
RUN echo '/usr/bin/firefox' >> /home/firefox/firefox-pulseaudio-forward
RUN chmod 755 /home/firefox/firefox-pulseaudio-forward

ENTRYPOINT ["bash", "/home/firefox/firefox-pulseaudio-forward"]