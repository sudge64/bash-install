#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

if [ ! $(rpm -qa | grep -i rpmfusion) ]
then
    echo "Enable RPM Fusion Free and Non-Free Repos."
    dnf install \ https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    dnf install \ https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi

echo "Add Flathub repo"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Install CLI packages"
dnf install $(cat packages/dnf_cli.txt) -y
echo "Install Graphical packages"
dnf install $(cat packages/dnf_graphical.txt) -y

echo "Group Install Development Tools and Libraries"
dnf groupinstall "Development Tools" "Development Libraries" -y
echo "Group Install Virtualization"
dnf groupinstall "Virtualization" -y
echo "Group Install C Development Tools and Libraries"
dnf groupinstall "C Development Tools and Libraries" -y
