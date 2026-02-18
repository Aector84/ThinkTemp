#!/usr/bin/env bash

set -e

echo "Installing ThinkTemp..."

sudo cp src/thinktemp /usr/local/bin/thinktemp
sudo chmod +x /usr/local/bin/thinktemp

echo "Installation complete."
echo "Run with: sudo thinktemp"
