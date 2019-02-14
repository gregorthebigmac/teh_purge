#!/bin/bash

apt purge -y aisleriot \
&& apt purge -y brasero \
&& apt purge -y cheese \
&& apt purge -y deja-dup \
&& apt purge -y empathy \
&& apt purge -y evolution \
&& apt purge -y gnome-accessibility-profiles \
&& apt purge -y gnome-accessibility-themes \
&& apt purge -y gnome-calendar \
&& apt purge -y gnome-contacts \
&& apt purge -y gnome-documents \
&& apt purge -y gnome-getting-started-docs \
&& apt purge -y gnome-mahjongg \
&& apt purge -y gnome-maps \
&& apt purge -y gnome-mines \
&& apt purge -y gnome-music \
&& apt purge -y gnome-orca \
&& apt purge -y gnome-online-accounts \
&& apt purge -y gnome-online-miners \
&& apt purge -y gnome-photos \
&& apt purge -y gnome-sudoku \
&& apt purge -y gnome-user-guide \
&& apt purge -y gnome-weather \
&& apt purge -y libreoffice* \
&& apt purge -y rhythmbox \
&& apt purge -y totem \
&& apt autoremove -y \
&& apt-get install -y curl \
&& apt-get install -y arp-scan \
&& apt-get install -y htop \
&& apt-get install -y openssh-server \
&& curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
&& install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
&& sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
&& apt-get install -y apt-transport-https \
&& apt-get update && sudo apt upgrade \
&& apt-get install -y code \
&& apt-get install -y vlc \
&& rm microsoft.gpg \
&& apt-get install -y caffeine
