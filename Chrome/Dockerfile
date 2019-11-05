FROM ubuntu:bionic

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install wget.
RUN apt-get install -y wget gnupg pulseaudio

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable

USER apps
ENV HOME /home/apps

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/apps/chrome-pulseaudio-forward
RUN echo '/usr/bin/google-chrome-stable' >> /home/apps/chrome-pulseaudio-forward
RUN chmod 755 /home/apps/chrome-pulseaudio-forward

ENTRYPOINT ["bash", "/home/apps/chrome-pulseaudio-forward"]