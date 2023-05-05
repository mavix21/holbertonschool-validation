#!/bin/bash
set -euo pipefail

# Install Hugo and Make
apt-get update && apt-get install -y hugo make

# Build the website
make build
