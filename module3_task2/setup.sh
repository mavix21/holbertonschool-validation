#!/bin/bash

# apt-get update && apt-get install -y git make wget build-essential && wget 

sudo apt-get update
sudo apt-get install -y wget git curl

# install Hugo
sudo wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb && sudo dpkg -i hugo_extended_0.84.0_Linux-64bit.deb

# Download Go version 1.20.4
sudo wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz

# Install golangci-lint binary files
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin"

# Extract and move go binary to /usr/local
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz

sudo npm install -g markdownlint-cli
sudo npm install -g markdown-link-check
sudo apt install shellcheck

sudo apt-get -y install zip
sudo apt-get -y install python3-pip
python3 -m pip install requests

# include /usr/local/go/bin && (go env GOPATH)/bin in PATH
PATH=$PATH:$HOME/go/bin
export PATH
PATH=$PATH:$(go env GOPATH)/bin
export PATH
PATH=$PATH:/usr/local/go/bin
export PATH

git clone https://github.com/holbertonschool/W3C-Validator.git
sudo mv W3C-Validator /opt/
