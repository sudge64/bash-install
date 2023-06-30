#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Install cli packages."
apt install $(cat packages_apt_cli.txt) -y

echo "Install graphical packages."
apt install $(cat packages_apt_graphical.txt) -y

echo "Install dependencies for Neovim."
apt install python3.10-venv ninja-build gettext libtool libtool-bin cmake g++ pkg-config unzip curl doxygen -y

echo "Install Neovim from Github."
git clone https://github.com/neovim/neovim
