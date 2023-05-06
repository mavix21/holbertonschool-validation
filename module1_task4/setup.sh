#!/bin/bash
# Install wget
apt-get update
apt-get install -y wget tar

# Install Hugo version 0.84.0
HUGO_VERSION="0.84.0"
wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
tar -xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
mv hugo /usr/local/bin/
rm hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

# Install make
apt-get install -y make

# Build the website
make build
