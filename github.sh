#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

while getopts ":u:" option; do
    case $option in
        u) user_name=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

echo "Non sudo user name : $user_name"

echo "Install zsh-syntax-highlighting from GitHub"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$user_name/.zsh/zsh-syntax-highlighting

echo "Install zsh-syntax-highlighting from GitHub"
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$user_name/.zsh/zsh-autosuggestions

echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$user_name/.zsh/powerlevel10k

echo "Touch zshhistory"
touch "/home/$user_name/.cache/zshhistory"
