#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

release_file=/etc/os-release

echo "Installing Everyday Flatpaks."
flatpak install -y $(cat packages/flatpak_everyday.txt)

if grep -q "Nobara" $release_file
then
    echo "Installing Sound & Video Flatpaks."
    flatpak install -y $(cat packages/flatpak_sound_and_video.txt)
else
    echo "Installing Sound & Video Flatpaks."
    flatpak install -y org.blender.Blender org.audacityteam.Audacity org.freac.freac org.gimp.GIMP org.inkscape.Inkscape fr.handbrake.ghb com.obsproject.Studio com.orama_interactive.Pixelorama org.kde.krita
fi


echo "Installing Funtimes Flatpaks."
flatpak install -y $(cat packages/flatpak_funtimes.txt)

echo "Installing CAD Flatpaks."
flatpak install -y com.ultimaker.cura org.freecadweb.FreeCAD org.kicad.KiCad org.openscad.OpenSCAD
