FROM ubuntu:bionic

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install wget.
RUN apt-get install -y wget gnupg curl pulseaudio

# Set the Brave repo.
RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
RUN sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com bionic main" >> /etc/apt/sources.list.d/brave.list'

# Install Chrome.
RUN apt-get update && apt-get -y install brave-browser brave-keyring

USER apps
ENV HOME /home/apps

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/apps/brave-pulseaudio-forward
RUN echo '/usr/bin/brave-browser' >> /home/apps/brave-pulseaudio-forward
RUN chmod 755 /home/apps/brave-pulseaudio-forward

ENTRYPOINT ["bash", "/home/apps/brave-pulseaudio-forward"]