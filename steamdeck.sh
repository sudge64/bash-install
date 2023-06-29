#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

curl -v https://www.emudeck.com/EmuDeck.desktop -o EmuDeck.desktop
curl -L https://github.com/SteamDeckHomebrew/deck-installer/releases/latest/download/install_release.sh | sh
mv EmuDeck.desktop ~/Desktop
