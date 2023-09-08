#!/bin/bash

# Authored by C.J. Wade
# 09/05/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Emudeck"
curl -v https://www.emudeck.com/EmuDeck.desktop -o EmuDeck.desktop

echo "Decky Loader"
curl -L https://github.com/SteamDeckHomebrew/deck-installer/releases/latest/download/install_release.sh | sh
mv EmuDeck.desktop ~/Desktop

echo "CryoUtilities"
curl -v https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/InstallCryoUtilities.desktop -o InstallCryoUtilities.desktop
mv InstallCryoUtilities.desktop ~/Desktop

echo "Install Flatpaks"
flatpak install $(cat packages/flatpak_steamdeck.txt) -y
