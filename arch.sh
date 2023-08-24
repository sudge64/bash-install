#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Install cli packages."
pacman -S $(cat packages_pacman_cli.txt) -y

echo "Install graphical packages."
pacman -S $(cat packages_pacman_graphical.txt) -y

echo "Install dependencies for Neovim."
pacman -S base-devel cmake unzip ninja curl -y
