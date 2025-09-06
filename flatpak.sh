#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

release_file=/etc/os-release

echo "Installing Everyday Flatpaks."
flatpak install -uy $(cat packages/flatpak_everyday.txt)

if grep -q "Nobara" "$release_file"
then
    echo "Installing Sound & Video Flatpaks."
    flatpak install -uy $(cat packages/flatpak_sound_and_video.txt)
    flatpak uninstall org.blender.Blender -y
else
    echo "Installing Sound & Video Flatpaks."
    flatpak install -uy $(cat packages/flatpak_sound_and_video.txt)
fi


echo "Installing Funtimes Flatpaks."
flatpak install -uy $(cat packages/flatpak_funtimes.txt)

echo "Installing CAD Flatpaks."
flatpak install -uy $(cat packages/flatpak_cad.txt)

