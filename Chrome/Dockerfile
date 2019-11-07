FROM ubuntu:bionic

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome
RUN mkdir -p /home/chrome && chown chrome:chrome /home/chrome

# Packages
RUN apt-get install -y apt-utils dbus-x11 libcanberra-gtk-module libcanberra-gtk3-module wget gnupg pulseaudio

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable
RUN apt-get install -y fonts-symbola libpango1.0-0 libv4l-0

USER chrome
ENV HOME /home/chrome

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/chrome/chrome-pulseaudio-forward
RUN echo '/usr/bin/google-chrome-stable --disable-gpu' >> /home/chrome/chrome-pulseaudio-forward
RUN chmod 755 /home/chrome/chrome-pulseaudio-forward

COPY local.conf /etc/fonts/local.conf

ENV LANG en-US

ENTRYPOINT ["bash", "/home/chrome/chrome-pulseaudio-forward"]