#!/bin/bash
# Adapted from https://github.com/catppuccin/gtk/blob/main/docs/USAGE.md
#
while getopts ":u:" option; do
    case $option in
        u) user_name=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

if [ ! -d "/home/$user_name/.local/share/themes" ]
then
    echo "Make /home/$user_name/.local/share/themes"
    sudo -u $user_name mkdir /home/$user_name/.local/share/themes
fi

cd /home/$user_name/.local/share/themes

# Set the root URL
export ROOT_URL="https://github.com/catppuccin/gtk/releases/download"

# Change to the tag you want to download
export RELEASE="v1.0.3"
  
# Change to suite your flavor / accent combination
export FLAVOR="macchiato"
export ACCENT="sapphire"
wget "${ROOT_URL}/${RELEASE}/catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip"

# Extract the catppuccin zip file
unzip catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip

# Set the catppuccin theme directory
export THEME_DIR="/home/$user_name/.local/share/themes/catppuccin-${FLAVOR}-${ACCENT}-standard+default"

# Optionally, add support for libadwaita
mkdir -p "/home/$user_name/.config/gtk-4.0" && 
ln -sf "${THEME_DIR}/gtk-4.0/assets" "/home/$user_name/.config/gtk-4.0/assets" &&
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "/home/$user_name/.config/gtk-4.0/gtk.css" &&
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "/home/$user_name/.config/gtk-4.0/gtk-dark.css"

# Flatpak theming
sudo flatpak override --filesystem=$HOME/.local/share/themes
sudo flatpak override --env=GTK_THEME="catppuccin-${FLAVOR}-${ACCENT}-standard+default"

cd /home/$user_name/.github/bash-install
