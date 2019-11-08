FROM debian:sid-slim

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN groupadd -r browdock && useradd -r -s /bin/false -g browdock browdock
RUN mkdir -p /home/browdock/Downloads && chown -R browdock:browdock /home/browdock

# Packages
RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module pulseaudio chromium fonts-symbola libpango1.0-0 libv4l-0 --no-install-recommends

RUN apt-get clean; apt-get autoclean

COPY local.conf /etc/fonts/local.conf

USER browdock
ENV HOME /home/browdock

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/browdock/chromium-pulseaudio-forward
RUN echo '/usr/bin/chromium --disable-gpu' >> /home/browdock/chromium-pulseaudio-forward
RUN chmod 755 /home/browdock/chromium-pulseaudio-forward

ENTRYPOINT ["bash", "/home/browdock/chromium-pulseaudio-forward"]