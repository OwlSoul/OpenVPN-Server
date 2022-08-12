#!/bin/bash

VERSION="1.0.1"

# Build the docker image
docker build -t "owlsoul/openvpn-server:aarch64-$VERSION" .
docker build -t "owlsoul/openvpn-server:aarch64-latest" .
