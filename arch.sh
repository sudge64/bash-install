#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

while getopts ":c:h" option; do
    case $option in
        c) choice=$OPTARG;;
        h) choice_hyprland=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

function server_install(){
    echo "Install cli packages."
    pacman -S $(cat packages/pacman_cli.txt) --noconfirm

    echo "Install dependencies for Neovim."
    pacman -S base-devel cmake unzip ninja curl --noconfirm
}

if [ $choice -eq 1 ]
then
    server_install
elif [ $choice -eq 2 ]
then 
    server_install
    echo "Install graphical packages."
    pacman -S $(cat packages/pacman_graphical.txt) --noconfirm
else
    echo "invalid choice?"
fi

if [ $choice_hyprland -eq 1]
then
    echo "Installing Hyprland"
    pacman -S $(cat packages/hyprland.txt) --noconfirm
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
    echo "invalid choice?"
fi

