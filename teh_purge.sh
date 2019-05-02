#!/bin/bash

apt purge aisleriot
# apt purge brasero
apt purge cheese
apt purge deja-dup
apt purge empathy
apt purge evolution
apt purge gnome-accessibility-profiles
apt purge gnome-accessibility-themes
apt purge gnome-calendar
# apt purge gnome-contacts
# apt purge gnome-documents
apt purge gnome-getting-started-docs
apt purge gnome-mahjongg
apt purge gnome-maps
apt purge gnome-mines
apt purge gnome-music
apt purge gnome-orca
# apt purge gnome-online-accounts
# apt purge gnome-online-miners
apt purge gnome-photos
apt purge gnome-sudoku
apt purge gnome-user-guide
apt purge gnome-weather
apt purge libreoffice*
apt purge rhythmbox
apt purge totem
apt autoremove
apt-get install curl
apt-get install arp-scan
apt-get install htop
apt-get install openssh-server
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https
apt-get update && sudo apt upgrade
apt-get install code
apt-get install vlc
rm microsoft.gpg
apt-get install caffeine
apt-get install keepass2
