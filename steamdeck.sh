#!/bin/bash

# Authored by C.J. Wade
# 09/05/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Emudeck"
curl -v https://www.emudeck.com/EmuDeck.desktop -o EmuDeck.desktop
mv EmuDeck.desktop ~/Desktop

echo "Decky Loader"
curl -v https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/decky_installer.desktop -o decky_installer.desktop
mv decky_installer.desktop ~/Desktop

echo "CryoUtilities"
curl -v https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/InstallCryoUtilities.desktop -o InstallCryoUtilities.desktop
mv InstallCryoUtilities.desktop ~/Desktop

echo "Install Flatpaks"
flatpak install "$(cat packages/flatpak_steamdeck.txt)" -y
