FROM debian:sid-slim

RUN apt-get update; apt-get upgrade -y; apt-get clean

# Add a user for running applications.
RUN groupadd -r chromium && useradd -r -s /bin/false -g chromium chromium
RUN mkdir -p /home/chromium/Downloads && chown -R chromium:chromium /home/chromium

# Packages
RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module pulseaudio chromium fonts-symbola libpango1.0-0 libv4l-0 --no-install-recommends

RUN apt-get clean; apt-get autoclean

COPY local.conf /etc/fonts/local.conf

USER chromium
ENV HOME /home/chromium

RUN echo 'export PULSE_SERVER="tcp:127.0.0.1:4713"' >> /home/chromium/chromium-pulseaudio-forward
RUN echo '/usr/bin/chromium --disable-gpu' >> /home/chromium/chromium-pulseaudio-forward
RUN chmod 755 /home/chromium/chromium-pulseaudio-forward

ENTRYPOINT ["bash", "/home/chromium/chromium-pulseaudio-forward"]