FROM debian:sid-slim

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN groupadd -r browdock && useradd -r -s /bin/false -g browdock browdock
RUN mkdir -p /home/browdock/Downloads && chown -R browdock:browdock /home/browdock

# Packages
RUN apt-get install -y apt-utils gnupg curl

# Set the Brave repo.
RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
RUN sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com bionic main" >> /etc/apt/sources.list.d/brave.list'

# Install Chrome.
RUN apt-get update && apt-get -y install libcanberra-gtk-module libcanberra-gtk3-module brave-browser brave-keyring pulseaudio fonts-symbola libpango1.0-0 libv4l-0 --no-install-recommends

RUN apt-get clean; apt-get autoclean

COPY local.conf /etc/fonts/local.conf

USER browdock
ENV HOME /home/browdock

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/browdock/brave-pulseaudio-forward
RUN echo '/usr/bin/brave-browser --disable-gpu' >> /home/browdock/brave-pulseaudio-forward
RUN chmod 755 /home/browdock/brave-pulseaudio-forward

ENTRYPOINT ["bash", "/home/browdock/brave-pulseaudio-forward"]