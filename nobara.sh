#!/bin/bash

# Authored by C.J. Wade
# 01/02/24
# https://cj-wade.com
# https://github.com/sudge64

while getopts ":c:" option; do
    case $option in
        c) choice=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

function server_install(){
    echo "Install CLI packages"
    dnf install $(cat packages/dnf_cli.txt) -y

    echo "Group Install C Development Tools and Libraries"
    dnf group install "c-development" -y
    echo "Install Virtualization"
    dnf install $(cat packages/nobara_virt.txt) -y
    echo "Group Install Development Tools"
    dnf group install "development-tools" -y
}

if [ ! $(rpm -qa | grep -i rpmfusion) ]
then
    echo "Enable RPM Fusion Free and Non-Free Repos."
    dnf install \ https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    dnf install \ https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi

echo "Add Flathub repo"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


if [ $choice -eq 1 ]
then
    server_install
elif [ $choice -eq 2 ]
then 
    server_install
    echo "Install Graphical packages"
    dnf install $(cat packages/dnf_graphical.txt) -y
    echo "Install pipx"
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
else
    echo "invalid choice?"
fi
