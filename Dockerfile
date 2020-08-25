# OpenVPN server packed inside docker container

FROM ubuntu:20.04

ARG HOMEDIR="/home/openvpn"

# It's a goot idea to always set this thing
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenVPN server
RUN apt-get update && apt-get install -y openvpn \
                                         iputils-ping \
    && apt-get clean

# Create a user for OpenVPN to run
RUN mkdir -p "$HOMEDIR" && \ 
    mkdir -p "$HOMEDIR/config" && \
    mkdir -p "$HOMEDIR/certs"

# NOTE: Private keys and config from certs and config folders are not included in this
# image. The image is uploaded to dockerhub and is universal.
# Certs and config must be supplied using external volumes instead.

# Create status log directory
RUN mkdir -p /var/log/openvpn*

# Run the OpenVPN server in foreground (docker will restart if it fails)
CMD /usr/sbin/openvpn --config /home/openvpn/config/server.conf
