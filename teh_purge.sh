#!/bin/bash

apt purge aisleriot
apt purge brasero
apt purge cheese
apt purge deja-dup
apt purge empathy
apt purge evolution
apt purge gnome-accessibility-profiles
apt purge gnome-accessibility-themes
apt purge gnome-calendar
apt purge gnome-contacts
apt purge gnome-documents
apt purge gnome-getting-started-docs
apt purge gnome-mahjongg
apt purge gnome-maps
apt purge gnome-mines
apt purge gnome-music
apt purge gnome-orca
apt purge gnome-online-accounts
apt purge gnome-online-miners
apt purge gnome-photos
apt purge gnome-sudoku
apt purge gnome-user-guide
apt purge gnome-weather
apt purge libreoffice*
apt purge rhythmbox
apt purge totem
rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
rm -rf /usr/share/unity-webapps/userscripts/unity-webapps-amazon
apt purge apport
apt autoremove
apt-get install -y curl
apt-get install -y arp-scan
apt-get install -y htop
apt-get install -y openssh-server
apt-get install -y unity-tweak-tool
apt-get install -y compizconfig-settings-manager
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install -y apt-transport-https
apt-get update && sudo apt upgrade -y
apt-get install -y code
apt-get install -y vlc
rm microsoft.gpg
apt-get install -y caffeine
apt-get install -y keepass2
