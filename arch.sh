#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Install cli packages."
pacman -S $(cat packages_cli.txt) -y

echo "Install graphical packages."
pacman -S $(cat packages_graphical.txt) -y

echo "Install dependencies for Neovim."
pacman -S python3.10-venv ninja-build gettext libtool libtool-bin cmake g++ pkg-config unzip curl doxygen -y
