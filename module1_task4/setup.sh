#!/bin/bash

apt-get update && apt-get install -y git make wget && wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb && dpkg -i hugo_extended_0.84.0_Linux-64bit.deb

# Build the website
make build
