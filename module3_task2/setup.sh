#!/bin/bash

# apt-get update && apt-get install -y git make wget build-essential && wget 

sudo apt-get update
sudo apt-get install -y wget
sudo wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb && sudo dpkg -i hugo_extended_0.84.0_Linux-64bit.deb
sudo npm install -g markdownlint-cli
sudo npm install -g markdown-link-check
sudo apt install shellcheck
sudo apt-get -y install zip
