#!/bin/bash

# Authored by C.J. Wade
# 08/29/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Install cli packages."
apt install $(cat packages/apt_cli.txt) -y

echo "Install 'The Assistant'"
pip3 install yt-dlp
echo "Install pipx"
python3 -m pip install --user pipx
python3 -m pipx ensurepath

