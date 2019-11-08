FROM debian:sid-slim

ARG USER_ID
ARG GROUP_ID

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Packages
RUN apt-get install -y apt-utils wget gnupg

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install libcanberra-gtk-module libcanberra-gtk3-module google-chrome-stable pulseaudio fonts-symbola libpango1.0-0 libv4l-0 --no-install-recommends

RUN apt-get clean; apt-get autoclean

COPY local.conf /etc/fonts/local.conf

RUN mkdir -p /home/browdock/Downloads
RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/browdock/chrome-pulseaudio-forward
RUN echo '/usr/bin/google-chrome-stable --disable-gpu' >> /home/browdock/chrome-pulseaudio-forward
RUN chown -R ${USER_ID}:${GROUP_ID} /home/browdock

USER ${USER_ID}

ENV HOME /home/browdock

ENTRYPOINT ["bash", "/home/browdock/chrome-pulseaudio-forward"]