#!/bin/bash

# Authored by C.J. Wade
# 08/29/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Set Dock autohide delay to 0"
defaults write com.apple.dock autohide-delay -float 0

echo "Set Dock autohide time modifier to 0"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Killall Dock"
killall Dock

echo "Show path in Finder"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true


if [ ! -f /opt/homebrew/bin/brew ]
then 
    echo "Install Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Install brew packages."
cd packages
brew bundle install
cd ..

echo "REMEMBER"
echo "1.) Open Terminal

2.) Type $(ping ocsp.apple.com), it should say something like $(64 bytes received)... yada yada yada. This is the address of the server that Apple uses to collect your app data.

3.) Press control+C to quit that back and forth.

4.) type $(sudo nano /etc/hosts)

5.) type in your password, it will be blank, but your password is being entered.

6.) Use the Arrow Keys to go to the bottom of the file.

7.) Type $(0.0.0.0		ocsp.apple.com)

8.) Press Control + O

9.) Press Return

10.) Press Control + X

11.) OPTIONAL: Type $(ping ocsp.apple.com), it should now comeback with something like $(request timeout). This shows that your Mac and Apple’s data collection server can not connect."
