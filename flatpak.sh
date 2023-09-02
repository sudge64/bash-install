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
    flatpak install -y org.audacityteam.Audacity org.freac.freac org.gimp.GIMP org.inkscape.Inkscape fr.handbrake.ghb com.obsproject.Studio com.orama_interactive.Pixelorama org.kde.krita
else
    echo "Installing Sound & Video Flatpaks."
    flatpak install -y org.blender.Blender org.audacityteam.Audacity org.freac.freac org.gimp.GIMP org.inkscape.Inkscape fr.handbrake.ghb com.obsproject.Studio com.orama_interactive.Pixelorama org.kde.krita
fi


echo "Installing Funtimes Flatpaks."
flatpak install -y net.davidotek.pupgui2 org.libretro.RetroArch org.DolphinEmu.dolphin-emu org.citra_emu.citra org.yuzu_emu.yuzu net.pcsx2.PCSX2 net.rpcs3.RPCS3 net.lutris.Lutris org.prismlauncher.PrismLauncher

echo "Installing CAD Flatpaks."
flatpak install -y com.ultimaker.cura org.freecadweb.FreeCAD org.kicad.KiCad org.openscad.OpenSCAD
