#!/bin/bash

# apt-get update && apt-get install -y git make wget build-essential && wget 

sudo apt-get update
sudo apt-get install -y wget
sudo wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb && sudo dpkg -i hugo_extended_0.84.0_Linux-64bit.deb
sudo npm install -g markdownlint-cli
sudo npm install -g markdown-link-check
sudo apt install shellcheck
sudo apt-get -y install zip
sudo apt-get -y install python3-pip
python3 -m pip install requests
sudo apt-get -y install git
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin"

# include /usr/local/go/bin && (go env GOPATH)/bin in PATH
PATH=$PATH:$(HOME)/go/bin:$(go env GOPATH)/bin
export PATH

git clone https://github.com/holbertonschool/W3C-Validator.git
sudo mv W3C-Validator /opt/
